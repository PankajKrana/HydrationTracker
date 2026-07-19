//
//  SplashScreen.swift
//  HydrationTracker
//

import SwiftUI

struct SplashScreen: View {
    @Binding var isPresented: Bool

    @State private var dropletOffset: CGFloat = -220
    @State private var dropletOpacity: Double = 0
    @State private var bottleScale: CGFloat = 0.5
    @State private var bottleOpacity: Double = 0
    @State private var float = false
    @State private var titleOffset: CGFloat = 24
    @State private var titleOpacity: Double = 0
    @State private var taglineOpacity: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.hydraPrimary, Color.hydraPrimaryLight, Color.hydraSky],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Soft glow orbs
            Circle()
                .fill(Color.white.opacity(0.18))
                .frame(width: 260, height: 260)
                .blur(radius: 50)
                .offset(x: -120, y: -200)

            VStack(spacing: 20) {
                ZStack {
                    Image(.waterdrop)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44)
                        .offset(y: dropletOffset)
                        .opacity(dropletOpacity)

                    Image(.waterBottle)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 170)
                        .scaleEffect(bottleScale)
                        .opacity(bottleOpacity)
                        .offset(y: float ? -10 : 10)
                }

                VStack(spacing: 8) {
                    Text("Hydration Tracker")
                        .font(.hero)
                        .bold()
                        .foregroundStyle(.white)
                        .offset(y: titleOffset)
                        .opacity(titleOpacity)

                    Text("Stay hydrated, stay healthy")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                        .opacity(taglineOpacity)
                }
            }
        }
        .onAppear(perform: startAnimations)
        .task(dismissAfterDelay)
        .onTapGesture { dismiss() }
    }

    private func startAnimations() {
        withAnimation(.easeOut(duration: 0.7)) {
            dropletOffset = 0
            dropletOpacity = 1
        }
        withAnimation(.easeInOut(duration: 0.5).delay(0.55)) {
            dropletOpacity = 0
        }
        withAnimation(.spring(response: 0.6, dampingFraction: 0.65).delay(0.35)) {
            bottleScale = 1
            bottleOpacity = 1
        }
        withAnimation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true).delay(1.1)) {
            float = true
        }
        withAnimation(.easeOut(duration: 0.6).delay(0.7)) {
            titleOffset = 0
            titleOpacity = 1
        }
        withAnimation(.easeOut(duration: 0.6).delay(1.0)) {
            taglineOpacity = 1
        }
    }

    private func dismissAfterDelay() async {
        try? await Task.sleep(for: .seconds(2.6))
        dismiss()
    }

    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.4)) {
            isPresented = false
        }
    }
}
