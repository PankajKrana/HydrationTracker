//
//  RootView.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct RootView: View {
    @State private var router: AppRouter
    private let loggedIn: Bool

    init() {
        let loggedIn = UserDefaults.standard.bool(forKey: StorageKey.isLoggedIn)
        self.loggedIn = loggedIn
        _router = State(initialValue: AppRouter(startingAt: loggedIn ? .content : .welcome))
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            initialScreen
                .navigationDestination(for: AppRouter.Route.self) { route in
                    destination(for: route)
                        .navigationBarBackButtonHidden(true)
                }
        }
        .environment(router)
        .tint(Color.hydraPrimary)
    }

    @ViewBuilder
    private var initialScreen: some View {
        if loggedIn {
            MainTabView()
        } else {
            WelcomeScreen()
        }
    }

    @ViewBuilder
    private func destination(for route: AppRouter.Route) -> some View {
        switch route {
        case .content:          MainTabView()
        case .welcome:          WelcomeScreen()
        case .onboarding:       OnboardingScreen()
        case .signUp:           SignUpWithEmail(mode: .signUp)
        case .login:            SignUpWithEmail(mode: .login)
        case .onboardingGender: OnboardingAgeScreen()
        case .age:              AgeScreen()
        case .weight:           WeightScreen()
        case .height:           HeightScreen()
        case .bedTime:          BedTimeScreen()
        case .dailyGoal:        DailyGoalScreen_()
        case .home:             MainTabView()
        case .history:          HistoryScreen()
        case .insight:          InsightScreen()
        case .setting:          SettingScreen()
        }
    }
}
