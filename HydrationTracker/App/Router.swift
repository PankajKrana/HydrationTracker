//
//  Router.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

@Observable
final class AppRouter {

    var path = NavigationPath()

    enum Route: Hashable {
        case content
        case onboarding
        case signUp
        case onboardingGender
        case age
        case weight
        case height
        case bedTime
        case dailyGoal
        case home
        case history
        case insight
        case setting
    }

    // core path ops
    func push(_ route: Route) { path.append(route) }
    func pop() { guard !path.isEmpty else { return }; path.removeLast() }
    func popToRoot() { path = NavigationPath() }

    
    func reset(to route: Route) { path = NavigationPath([route]) }

    // convenience intents so any child can call router.goToX()
    func goToSignUp()      { push(.signUp) }
    func goToHome()        { reset(to: .home) }
    func goToOnboarding()  { reset(to: .onboarding) }
    func goToHistory()     { push(.history) }
    func goToInsight()     { push(.insight) }
    func goToSettings()    { push(.setting) }
}

