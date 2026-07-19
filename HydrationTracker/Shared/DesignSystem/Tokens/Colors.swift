//
//  Colors.swift
//  HydrationTracker
//
//  Premium hydration design palette.
//

import SwiftUI

extension Color {

    // MARK: - Primary blues
    static let hydraPrimary = Color(hex: "#4F8CFF")
    static let hydraPrimaryLight = Color(hex: "#6AAEFF")
    static let hydraSky = Color(hex: "#8FD3FF")
    static let hydraCyan = Color(hex: "#5FE0E6")

    // MARK: - Backgrounds & surfaces
    static let hydraBg = Color(hex: "#F2F7FF")
    static let hydraSurface = Color.white
    static let hydraCard = Color.white
    static let hydraGrayCard = Color(hex: "#F4F6FA")

    // MARK: - Text
    static let hydraInk = Color(hex: "#0B1B3B")
    static let hydraInkSecondary = Color(hex: "#5B6B85")
    static let hydraInkTertiary = Color(hex: "#9AA7BE")

    // MARK: - Accent
    static let hydraNavy = Color(hex: "#102A56")
    static let hydraSuccess = Color(hex: "#34C98B")
    static let hydraWarning = Color(hex: "#FFB020")

    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 6:
            r = int >> 16
            g = int >> 8 & 0xFF
            b = int & 0xFF
        default:
            r = 79; g = 140; b = 255
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}

extension Gradient {
    static let hydra = Gradient(colors: [Color.hydraPrimary, Color.hydraSky])
    static let hydraVertical = Gradient(colors: [Color.hydraPrimary, Color.hydraPrimaryLight, Color.hydraSky])
    static let hydraSoft = Gradient(colors: [Color.hydraPrimary.opacity(0.20), Color.hydraSky.opacity(0.08)])
    static let hydraBg = Gradient(colors: [Color.hydraPrimary.opacity(0.28), Color.hydraBg, Color.white])
}

extension LinearGradient {
    static let hydra = LinearGradient(
        gradient: .hydra,
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let hydraVertical = LinearGradient(
        gradient: .hydraVertical,
        startPoint: .top,
        endPoint: .bottom
    )
    static let hydraSoft = LinearGradient(
        gradient: .hydraSoft,
        startPoint: .top,
        endPoint: .bottom
    )
}
