//
//  WelcomeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

struct WelcomeScreen: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()

            // Decorative blurred orbs
            VStack {
                HStack {
                    Circle().fill(Color.hydraSky.opacity(0.25))
                        .frame(width: 180, height: 180)
                        .blur(radius: 40)
                        .offset(x: -60, y: -40)
                    Spacer()
                }
                Spacer()
            }

            ScrollView {
                VStack(spacing: 28) {
                    Spacer().frame(height: 40)

                    // Hero illustration
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [Color.hydraPrimary, Color.hydraSky], startPoint: .top, endPoint: .bottom))
                            .frame(width: 200, height: 200)
                            .shadow(color: Color.hydraPrimary.opacity(0.35), radius: 30, y: 16)
                        Image(.waterdrop)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .foregroundStyle(.white)
                        // floating bubble
                        Image(systemName: "drop.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(.white.opacity(0.9))
                            .offset(x: 86, y: -70)
                            .rotationEffect(.degrees(-15))
                    }

                    VStack(spacing: 12) {
                        Text("Stay Hydrated,\nStay Healthy")
                            .font(.hero)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.hydraInk)
                            .readableLineSpacing(6)
                        Text("Track every sip, build streaks, and reach your daily goal with a calm, beautiful routine.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.hydraInkSecondary)
                            .frame(maxWidth: 320)
                    }
                    .padding(.horizontal, Spacing.s3)

                    Spacer().frame(height: 8)

                    VStack(spacing: 16) {
                        PrimaryButton(title: "Get Started") {
                            router.goToSignUp()
                        }
                        .padding(.horizontal, Spacing.s3)

                        GhostButton(title: "I already have an account") {
                            router.goToLogin()
                        }
                    }

                    Spacer().frame(height: 24)
                }
                .padding(.vertical, 40)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    WelcomeScreen()
        .environment(AppRouter())
}
