//
//  SettingScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct SettingScreen: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        List {
            Section("Go to") {
                Button("History") { router.goToHistory() }
                Button("Insights") { router.goToInsight() }
            }

            Section("Navigation") {
                Button("Back to Home") { router.goToHome() }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingScreen()
        .environment(AppRouter())
}
