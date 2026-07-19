//
//  IntakeStore.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import Foundation

/// A single logged drink. Persisted as JSON in UserDefaults (AppStorage's backing store).
struct IntakeEntry: Identifiable, Codable, Hashable {
    let id: UUID
    let amountML: Int
    let date: Date

    init(amountML: Int, date: Date = Date()) {
        self.id = UUID()
        self.amountML = amountML
        self.date = date
    }

    var timeLabel: String { Self.timeFormatter.string(from: date) }
    var amountLabel: String { "+\(amountML) ml" }

    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .short
        return f
    }()
}

struct DayTotal: Identifiable {
    let date: Date
    let totalML: Int
    var id: Date { date }
}

/// App-wide source of truth for water intake. One shared instance so the
/// sheet, home, history and insights all reflect the same logged drinks.
@Observable
final class IntakeStore {
    static let shared = IntakeStore()

    private(set) var entries: [IntakeEntry]

    init() {
        self.entries = Self.load()
    }

    // MARK: - Mutations

    func add(amountML: Int) {
        entries.append(IntakeEntry(amountML: amountML))
        save()
    }

    func remove(_ entry: IntakeEntry) {
        entries.removeAll { $0.id == entry.id }
        save()
    }

    // MARK: - Derived (today)

    var todayEntries: [IntakeEntry] {
        entries.filter { Calendar.current.isDateInToday($0.date) }
            .sorted { $0.date < $1.date }
    }

    var todayTotalML: Int {
        todayEntries.reduce(0) { $0 + $1.amountML }
    }

    // MARK: - Derived (last 7 days)

    func totalML(on date: Date) -> Int {
        entries
            .filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
            .reduce(0) { $0 + $1.amountML }
    }

    /// Oldest → newest, today last.
    var weeklyTotals: [DayTotal] {
        let calendar = Calendar.current
        return (0..<7).compactMap { offset in
            guard let date = calendar.date(byAdding: .day, value: -(6 - offset), to: startOfToday()) else { return nil }
            return DayTotal(date: date, totalML: totalML(on: date))
        }
    }

    var maxDayTotalML: Int {
        max(weeklyTotals.map(\.totalML).max() ?? 1, 1)
    }

    var totalWeekML: Int {
        weeklyTotals.reduce(0) { $0 + $1.totalML }
    }

    var averagePerDayML: Int {
        let activeDays = weeklyTotals.filter { $0.totalML > 0 }.count
        return activeDays > 0 ? totalWeekML / activeDays : 0
    }

    var goalLiters: Double {
        let stored = UserDefaults.standard.double(forKey: StorageKey.dailyGoalLiters)
        return stored > 0 ? stored : 3.0
    }

    var goalDaysInWeek: Int {
        weeklyTotals.filter { Double($0.totalML) / 1000 >= goalLiters }.count
    }

    /// Consecutive days (ending today) that met the goal.
    var streakDays: Int {
        var streak = 0
        for offset in 0..<365 {
            let date = Calendar.current.date(byAdding: .day, value: -offset, to: startOfToday())!
            if Double(totalML(on: date)) / 1000 >= goalLiters {
                streak += 1
            } else {
                break
            }
        }
        return streak
    }

    // MARK: - Helpers

    static func weekdaySymbol(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "EEEEE"
        return f.string(from: date)
    }

    private func startOfToday() -> Date {
        Calendar.current.startOfDay(for: Date())
    }

    // MARK: - Persistence

    private func save() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: StorageKey.intakeEntries)
        }
    }

    private static func load() -> [IntakeEntry] {
        guard let data = UserDefaults.standard.data(forKey: StorageKey.intakeEntries),
              let decoded = try? JSONDecoder().decode([IntakeEntry].self, from: data) else {
            return []
        }
        return decoded
    }
}
