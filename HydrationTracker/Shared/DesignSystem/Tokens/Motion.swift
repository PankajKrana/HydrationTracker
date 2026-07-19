//
//  Motion.swift
//  HydrationTracker
//
//  Tasteful, shared animation presets.
//

import SwiftUI

extension Animation {
    /// Gentle spring for press / selection feedback.
    static let gentle = Animation.spring(response: 0.5, dampingFraction: 0.82)
    /// Bouncier spring for entrance / celebratory moments.
    static let bouncy = Animation.spring(response: 0.42, dampingFraction: 0.62)
    /// Smooth ease for fades and layout.
    static let smooth = Animation.easeInOut(duration: 0.4)
    /// Snappy for micro-interactions.
    static let snappy = Animation.spring(response: 0.3, dampingFraction: 0.7)
}

extension View {
    /// Staggered card-entrance: fade + rise. Use with an `animate` Bool.
    func cardEntrance(delay: Double = 0, show: Bool = true) -> some View {
        self
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : 16)
            .animation(.gentle.delay(delay), value: show)
    }
}
