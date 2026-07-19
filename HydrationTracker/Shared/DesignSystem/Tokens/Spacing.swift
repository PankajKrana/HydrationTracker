//
//  Spacing.swift
//  HydrationTracker
//
//  8pt grid. Standard horizontal screen padding is 24.
//

import SwiftUI

enum Spacing {
    static let s1: CGFloat = 8
    static let s2: CGFloat = 16
    static let s3: CGFloat = 24
    static let s4: CGFloat = 32
    static let s5: CGFloat = 40
    static let s6: CGFloat = 48

    /// Standard horizontal padding for screen edges.
    static let screen: CGFloat = 24
}

extension View {
    /// Apply the standard 24pt horizontal screen padding.
    func screenPadding() -> some View {
        self.padding(.horizontal, Spacing.screen)
    }
}
