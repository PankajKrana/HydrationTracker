//
//  HydrationTrackerApp.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

@main
struct HydrationTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            AppContainer()
        }
    }
}

struct AppContainer: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreen(isPresented: $showSplash)
                    .transition(.opacity)
            } else {
                RootView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.4), value: showSplash)
    }
}
