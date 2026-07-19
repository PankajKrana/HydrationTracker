//
//  Charts.swift
//  HydrationTracker
//
//  Animated bar charts + achievement badges.
//

import SwiftUI

// MARK: - Weekly bar chart

struct WeeklyBarChart: View {
    struct Bar: Identifiable {
        let id = UUID()
        let label: String
        let value: Double      // liters
        let isToday: Bool
    }

    let bars: [Bar]
    let maxValue: Double

    @State private var show = false

    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ForEach(Array(bars.enumerated()), id: \.element.id) { index, bar in
                VStack(spacing: 8) {
                    Capsule()
                        .fill(bar.isToday
                              ? LinearGradient.hydra
                              : LinearGradient(colors: [Color.hydraPrimary.opacity(0.35), Color.hydraSky.opacity(0.18)], startPoint: .bottom, endPoint: .top))
                        .frame(height: show ? max(28, CGFloat(bar.value / max(maxValue, 0.001)) * 120) : 28)
                        .animation(.bouncy.delay(Double(index) * 0.05), value: show)
                    Text(bar.label)
                        .font(.caption)
                        .foregroundStyle(bar.isToday ? Color.hydraPrimary : Color.hydraInkSecondary)
                }
            }
        }
        .onAppear { show = true }
    }
}

// MARK: - Monthly bar chart

struct MonthlyBarChart: View {
    struct Bar: Identifiable {
        let id = UUID()
        let day: Int
        let value: Double
        let inCurrentMonth: Bool
    }

    let bars: [Bar]
    let maxValue: Double

    @State private var show = false

    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            ForEach(Array(bars.enumerated()), id: \.element.id) { index, bar in
                VStack(spacing: 4) {
                    Capsule()
                        .fill(bar.inCurrentMonth
                              ? LinearGradient(colors: [Color.hydraPrimary, Color.hydraSky], startPoint: .bottom, endPoint: .top)
                              : LinearGradient(colors: [Color.hydraGrayCard, Color.hydraGrayCard], startPoint: .bottom, endPoint: .top))
                        .frame(height: show ? max(8, CGFloat(bar.value / max(maxValue, 0.001)) * 90) : 8)
                        .animation(.bouncy.delay(Double(index) * 0.01), value: show)
                    if index % 5 == 0 {
                        Text("\(bar.day)")
                            .font(.micro)
                            .foregroundStyle(Color.hydraInkTertiary)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear { show = true }
    }
}

// MARK: - Achievement badge

struct AchievementBadge: View {
    let icon: String
    let title: String
    var tint: Color = Color.hydraPrimary
    var earned: Bool = true

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(earned
                          ? LinearGradient(colors: [tint, tint.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                          : LinearGradient(colors: [Color.hydraGrayCard, Color.hydraGrayCard], startPoint: .top, endPoint: .bottom))
                    .frame(width: 56, height: 56)
                Image(systemName: icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(earned ? Color.white : Color.hydraInkTertiary)
            }
            Text(title)
                .font(.caption)
                .foregroundStyle(earned ? Color.hydraInk : Color.hydraInkTertiary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}
