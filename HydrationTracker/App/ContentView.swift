//
//  ContentView.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 17/07/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(AppRouter.self) private var router
    private enum Tab: Hashable { case home, history, plus , insights, settings }
    @State private var selected: Tab = .home
    @State private var showingPlusSheet: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            // Content area
            Group {
                switch selected {
                case .home:
                    HomeScreen()
                case .history:
                    HistoryScreen()
                case .plus:
                    PlusView()
                case .insights:
                    InsightScreen()
                case .settings:
                    SettingScreen()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Custom tab bar
            HStack {
                tabButton(title: "Home", systemImage: "house", tab: .home)
                tabButton(title: "History", systemImage: "clock.arrow.circlepath", tab: .history)
                tabButton(title: "+", systemImage: "plus.circle", tab: .plus)
                tabButton(title: "Insights", systemImage: "chart.bar.xaxis", tab: .insights)
                tabButton(title: "Settings", systemImage: "gearshape", tab: .settings)
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .padding(.bottom, 12)
            .background(.ultraThinMaterial)
        }
        .ignoresSafeArea(edges: .bottom)
        .sheet(isPresented: $showingPlusSheet) {
            PlusSheetView()
                .presentationDetents([.medium, .large])
        }
        
        
        
    }

    @ViewBuilder
    private func tabButton(title: String, systemImage: String, tab: Tab) -> some View {
        Button {
            if tab == .plus {
                showingPlusSheet = true
            } else {
                selected = tab
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: systemImageFor(tab: tab, base: systemImage))
                    .font(.system(size: 20, weight: .semibold))
                Text(title)
                    .font(.caption2)
            }
            .foregroundStyle(selected == tab ? Color.accentColor : Color.secondary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 6)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    private func systemImageFor(tab: Tab, base: String) -> String {
        // Use filled variants when selected if available
        switch tab {
        case .home: return selected == .home ? "house.fill" : "house"
        case .history: return selected == .history ? "clock.arrow.circlepath" : "clock.arrow.circlepath"
        case .plus: return selected == .plus ? "plus.circle.fill" : "plus.circle"
        case .insights: return selected == .insights ? "chart.bar.xaxis" : "chart.bar.xaxis"
        case .settings: return selected == .settings ? "gearshape.fill" : "gearshape"
        }
    }
}

struct PlusView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "plus.circle")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            Text("Tap the + tab to add a new entry")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.clear)
    }
}



#Preview {
    ContentView()
        .environment(AppRouter())
}

