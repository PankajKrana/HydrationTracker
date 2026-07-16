//
//  HomeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        VStack(spacing: 16) {
            Text("Home")
                .font(.largeTitle)

            ReusableButton(title: "History") { router.goToHistory() }
            ReusableButton(title: "Insights") { router.goToInsight() }
            ReusableButton(title: "Settings") { router.goToSettings() }

            Button("Restart onboarding") {
                router.goToOnboarding()
            }
            .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    HomeScreen()
        .environment(AppRouter())
}
