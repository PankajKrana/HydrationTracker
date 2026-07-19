//
//  Shimmer.swift
//  HydrationTracker
//

import SwiftUI

/// Loading shimmer / skeleton highlight. Apply to a placeholder surface.
struct ShimmerModifier: ViewModifier {
    @State private var move = false

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geo in
                    LinearGradient(
                        colors: [.clear, Color.white.opacity(0.5), .clear],
                        startPoint: .init(x: move ? 1 : -1, y: 0.5),
                        endPoint: .init(x: move ? 2 : 0, y: 0.5)
                    )
                    .rotationEffect(.degrees(8))
                    .mask(content)
                    .animation(.easeInOut(duration: 1.1).repeatForever(autoreverses: false), value: move)
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            )
            .onAppear { move = true }
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
