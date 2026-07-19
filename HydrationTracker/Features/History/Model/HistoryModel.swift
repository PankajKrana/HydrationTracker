//
//  HistoryModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import Foundation

struct DayLog: Identifiable {
    let id = UUID()
    let weekday: String
    let date: Int
    let amount: Double
    let isToday: Bool
}

struct IntakeEntry: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let amount: String
}
