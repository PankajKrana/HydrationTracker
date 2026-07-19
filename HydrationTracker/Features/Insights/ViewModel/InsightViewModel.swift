//
//  InsightViewModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

@Observable
final class InsightViewModel {

    private let store = IntakeStore.shared
    private let calendar = Calendar.current

    let goal: Double = {
        let stored = UserDefaults.standard.double(forKey: StorageKey.dailyGoalLiters)
        return stored > 0 ? stored : 3.0
    }()

    var animate = false

    /// Hydration score: average weekly goal adherence, 0–100.
    var score: Int {
        let goalML = goal * 1000
        guard goalML > 0 else { return 0 }
        let adherence = Double(store.totalWeekML) / (goalML * 7)
        return min(100, max(0, Int(adherence * 100)))
    }

    var weekData: [InsightDay] {
        store.weeklyTotals.map { total in
            InsightDay(
                weekday: IntakeStore.weekdaySymbol(total.date),
                date: calendar.component(.day, from: total.date),
                amount: Double(total.totalML) / 1000,
                isToday: calendar.isDateInToday(total.date)
            )
        }
    }

    var insights: [InsightItem] {
        [
            .init(
                icon: "sun.max.fill",
                tint: .orange,
                title: "Morning boost needed",
                message: "You hit only 30% of your goal before noon. A glass on wake-up helps."
            ),
            .init(
                icon: "flame.fill",
                tint: .pink,
                title: "\(store.streakDays)-day streak",
                message: "Your consistency is paying off. Keep the momentum going!"
            ),
            .init(
                icon: "moon.fill",
                tint: .indigo,
                title: "Late-night sips",
                message: "You drink most after 8 PM. Try shifting intake earlier for deeper sleep."
            )
        ]
    }

    var maxAmount: Double {
        weekData.map(\.amount).max() ?? 1
    }

    var total: Double {
        weekData.map(\.amount).reduce(0, +)
    }

    var average: Double {
        total / Double(weekData.count)
    }

    var goalDays: Int {
        weekData.filter { $0.amount >= goal }.count
    }

    var weeklyBars: [WeeklyBarChart.Bar] {
        store.weeklyTotals.map { total in
            WeeklyBarChart.Bar(
                label: IntakeStore.weekdaySymbol(total.date),
                value: Double(total.totalML) / 1000,
                isToday: calendar.isDateInToday(total.date)
            )
        }
    }

    func onAppear() {
        animate = true
    }
}
