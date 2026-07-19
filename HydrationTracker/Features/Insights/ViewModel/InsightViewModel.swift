//
//  InsightViewModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

@Observable
final class InsightViewModel {

    let goal: Double = 3.0
    let score: Int = 78

    var animate = false

    let weekData: [InsightDay] = [
        .init(weekday: "M", date: 13, amount: 2.1, isToday: false),
        .init(weekday: "T", date: 14, amount: 3.4, isToday: false),
        .init(weekday: "W", date: 15, amount: 2.8, isToday: false),
        .init(weekday: "T", date: 16, amount: 1.6, isToday: false),
        .init(weekday: "F", date: 17, amount: 3.1, isToday: false),
        .init(weekday: "S", date: 18, amount: 3.6, isToday: false),
        .init(weekday: "S", date: 19, amount: 2.4, isToday: true)
    ]

    let insights: [InsightItem] = [
        .init(
            icon: "sun.max.fill",
            tint: .orange,
            title: "Morning boost needed",
            message: "You hit only 30% of your goal before noon. A glass on wake-up helps."
        ),
        .init(
            icon: "flame.fill",
            tint: .pink,
            title: "12-day streak",
            message: "Your consistency is in the top 10%. Keep the momentum going!"
        ),
        .init(
            icon: "moon.fill",
            tint: .indigo,
            title: "Late-night sips",
            message: "You drink most after 8 PM. Try shifting intake earlier for deeper sleep."
        )
    ]

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

    func onAppear() {
        animate = true
    }
}
