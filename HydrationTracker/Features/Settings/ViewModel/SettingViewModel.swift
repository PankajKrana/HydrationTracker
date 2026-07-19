//
//  SettingViewModel.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

@Observable
final class SettingViewModel {

    var name: String = UserDefaults.standard.string(forKey: StorageKey.userName) ?? "User"
    var dailyGoalLiters: Double = {
        let stored = UserDefaults.standard.double(forKey: StorageKey.dailyGoalLiters)
        return stored > 0 ? stored : 3.0
    }()
    var units: Units = .metric

    var remindersOn = true
    var notificationsOn = true
    var healthSyncOn = true
    var soundsOn = false

    var goalText: String {
        units == .metric
            ? String(format: "%.1f L", dailyGoalLiters)
            : String(format: "%.0f oz", dailyGoalLiters * 33.814)
    }
}
