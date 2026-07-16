//
//  BedTimeViewModel.swift
//  HydrationTracker
//

import SwiftUI

@Observable
final class BedTimeViewModel {

    enum Meridiem: String, CaseIterable {
        case am = "AM"
        case pm = "PM"
    }

    var hours: Int = 0
    var minutes: Int = 0
    var meridiem: Meridiem = .am

    var formattedTime: String {
        let displayHour = hours == 0 ? 12 : hours
        return String(format: "%02d:%02d %@", displayHour, minutes, meridiem.rawValue)
    }
}
