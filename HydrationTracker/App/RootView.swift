//
//  RootView.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct RootView: View {
    @State private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {
            OnboardingScreen()
                .navigationDestination(for: AppRouter.Route.self) { route in
                    switch route {
                    case .onboarding:       OnboardingScreen()
                    case .signUp:           SignUpWithEmail()
                    case .onboardingGender: OnboardingAgeScreen()
                    case .age:              AgeScreen()
                    case .weight:           WeightScreen()
                    case .height:           HeightScreen()
                    case .bedTime:          BedTimeScreen()
                    case .dailyGoal:        DailyGoalScreen_()
                    case .home:             HomeScreen()
                    case .history:          HistryScreen()
                    case .insight:          InsightScreen()
                    case .setting:          SettingScreen()
                    }
                }
        }
        .environment(router)
        // Any child view can call router.goToSignUp() / router.push(.age) to navigate
    }
}
