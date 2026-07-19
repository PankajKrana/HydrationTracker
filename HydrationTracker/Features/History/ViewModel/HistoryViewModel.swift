//
//  HistoryViewModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import Foundation

@Observable
final class HistoryViewModel {

    private let store = IntakeStore.shared
    private let calendar = Calendar.current

    var goal: Double { store.goalLiters }

    var weekData: [DayLog] {
        store.weeklyTotals.map { total in
            DayLog(
                weekday: IntakeStore.weekdaySymbol(total.date),
                date: calendar.component(.day, from: total.date),
                amount: Double(total.totalML) / 1000,
                isToday: calendar.isDateInToday(total.date)
            )
        }
    }

    var todayEntries: [IntakeEntry] { store.todayEntries }

    var maxAmount: Double { weekData.map(\.amount).max() ?? 1 }

    var totalWater: String {
        String(format: "%.1fL", Double(store.totalWeekML) / 1000)
    }

    var averagePerDay: String {
        String(format: "%.1fL", Double(store.averagePerDayML) / 1000)
    }

    var streak: String {
        "\(store.streakDays)d"
    }

    // MARK: - For charts

    var weeklyBars: [WeeklyBarChart.Bar] {
        store.weeklyTotals.map { total in
            WeeklyBarChart.Bar(
                label: IntakeStore.weekdaySymbol(total.date),
                value: Double(total.totalML) / 1000,
                isToday: calendar.isDateInToday(total.date)
            )
        }
    }

    var monthlyBars: [MonthlyBarChart.Bar] {
        let now = Date()
        let daysInMonth = calendar.range(of: .day, in: .month, for: now)!.count
        return (1...daysInMonth).map { day in
            guard let date = calendar.date(from: DateComponents(year: calendar.component(.year, from: now), month: calendar.component(.month, from: now), day: day)) else {
                return MonthlyBarChart.Bar(day: day, value: 0, inCurrentMonth: false)
            }
            let totalML = store.totalML(on: date)
            return MonthlyBarChart.Bar(day: day, value: Double(totalML) / 1000, inCurrentMonth: true)
        }
    }

    var monthlyMax: Double {
        monthlyBars.map(\.value).max() ?? 1
    }
}
