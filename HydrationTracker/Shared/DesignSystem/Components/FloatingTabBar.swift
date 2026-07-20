//
//  FloatingTabBar.swift
//  HydrationTracker
//
//  Custom floating, blurred, rounded bottom navigation + container.
//

import SwiftUI

enum MainTab: CaseIterable, Identifiable {
    case home, history, insights, profile

    var id: String { String(describing: self) }

    var title: String {
        switch self {
        case .home: "Home"
        case .history: "History"
        case .insights: "Insights"
        case .profile: "Profile"
        }
    }

    var icon: String {
        switch self {
        case .home: "drop.fill"
        case .history: "clock.arrow.circlepath"
        case .insights: "chart.bar.xaxis"
        case .profile: "person.fill"
        }
    }
}

struct FloatingTabBar: View {
    @Binding var selected: MainTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTab.allCases) { tab in
                Button {
                    withAnimation(.gentle) { selected = tab }
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(selected == tab ? Color.hydraPrimary : Color.hydraInkSecondary)
                        Text(tab.title)
                            .font(.micro)
                            .foregroundStyle(selected == tab ? Color.hydraPrimary : Color.hydraInkSecondary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, Spacing.s2)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.white.opacity(0.6), lineWidth: 1))
        .floatShadow()
        .padding(.horizontal, Spacing.s3)
    }
}

struct MainTabView: View {
    @State private var selected: MainTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selected {
                case .home: HomeScreen()
                case .history: HistoryScreen()
                case .insights: InsightScreen()
                case .profile: SettingScreen()
                }
            }

            FloatingTabBar(selected: $selected)
                .padding(.bottom, 2)
        }
    }
}
