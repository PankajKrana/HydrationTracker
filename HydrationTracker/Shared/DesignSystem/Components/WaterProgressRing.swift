//
//  WaterProgressRing.swift
//  HydrationTracker
//

import SwiftUI

/// Gradient-stroke progress ring with an animated trim and a center-content slot.
struct WaterProgressRing<Center: View>: View {
    let progress: Double          // 0...1
    var lineWidth: CGFloat = 18
    var trackColor: Color = Color.hydraGrayCard
    var animate: Bool = true
    @ViewBuilder var center: () -> Center

    @State private var shown = false
    private var display: Double {
        let clamped = min(max(progress, 0), 1)
        return animate ? (shown ? clamped : 0) : clamped
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(trackColor, lineWidth: lineWidth)
            Circle()
                .trim(from: 0, to: CGFloat(display))
                .stroke(LinearGradient.hydra, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.gentle, value: shown)
            center()
        }
        .onAppear { shown = true }
    }
}
