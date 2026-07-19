//
//  BedTimeViewModel.swift
//  HydrationTracker
//

import SwiftUI

@Observable
final class BedTimeViewModel {

    var bedtime: Date =
        Calendar.current.date(bySettingHour: 22, minute: 0, second: 0, of: .now)
        ?? .now

    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: bedtime)
    }
}
