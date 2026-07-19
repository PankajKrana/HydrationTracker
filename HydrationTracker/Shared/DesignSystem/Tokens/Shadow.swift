//
//  Shadow.swift
//  HydrationTracker
//
//  Smooth, soft shadows for the premium feel.
//

import SwiftUI

extension View {
    /// Soft brand-tinted shadow for primary surfaces / buttons.
    func softShadow() -> some View {
        self.shadow(color: Color.hydraPrimary.opacity(0.22), radius: 18, x: 0, y: 10)
    }

    /// Neutral, subtle elevation for cards.
    func cardShadow() -> some View {
        self.shadow(color: Color.black.opacity(0.06), radius: 14, x: 0, y: 6)
    }

    /// Slightly stronger shadow for floating elements (tab bar, FAB).
    func floatShadow() -> some View {
        self.shadow(color: Color.black.opacity(0.10), radius: 22, x: 0, y: 10)
    }
}
