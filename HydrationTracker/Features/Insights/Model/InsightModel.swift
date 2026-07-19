//
//  InsightModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

struct InsightDay: Identifiable {
    let id = UUID()
    let weekday: String
    let date: Int
    let amount: Double   
    let isToday: Bool
}

struct InsightItem: Identifiable {
    let id = UUID()
    let icon: String
    let tint: Color
    let title: String
    let message: String
}
