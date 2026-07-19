//
//  HistoryViewModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import Foundation

@Observable
final class HistoryViewModel {

    let goal: Double = 3.0

    let weekData: [DayLog] = [
        .init(weekday: "M", date: 13, amount: 2.1, isToday: false),
        .init(weekday: "T", date: 14, amount: 3.4, isToday: false),
        .init(weekday: "W", date: 15, amount: 2.8, isToday: false),
        .init(weekday: "T", date: 16, amount: 1.6, isToday: false),
        .init(weekday: "F", date: 17, amount: 3.1, isToday: false),
        .init(weekday: "S", date: 18, amount: 3.6, isToday: false),
        .init(weekday: "S", date: 19, amount: 2.4, isToday: true)
    ]

    let todayEntries: [IntakeEntry] = [
        .init(title: "Morning Refill", time: "7:20 AM", amount: "+350 ml"),
        .init(title: "Afternoon Refill", time: "1:05 PM", amount: "+500 ml"),
        .init(title: "Post-Workout", time: "5:40 PM", amount: "+450 ml"),
        .init(title: "Evening Refill", time: "8:15 PM", amount: "+300 ml")
    ]

    var maxAmount: Double {
        weekData.map(\.amount).max() ?? 1
    }

    var totalWater: String {
        "18.9L"
    }

    var averagePerDay: String {
        "2.7L"
    }

    var streak: String {
        "12d"
    }
}
