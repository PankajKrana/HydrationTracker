//
//  HistoryScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct HistoryScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = HistoryViewModel()

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()

            ScrollView {
                VStack(spacing: Spacing.s4) {
                    headerView
                    weeklyCard
                    statsRow
                    monthlyCard
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, Spacing.screen)
                .padding(.top, 12)
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("History")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var headerView: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient.hydra)
                    .frame(width: 56, height: 56)
                    .softShadow()
                Image(systemName: "drop.fill")
                    .font(.system(size: 26))
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Your Hydration")
                    .font(.subtitle)
                    .foregroundStyle(Color.hydraInk)
                Text("Last 7 Days")
                    .font(.body)
                    .foregroundStyle(Color.hydraInkSecondary)
            }
            Spacer()
            IconButton(systemImage: "calendar") {}
        }
    }

    private var weeklyCard: some View {
        Card {
            SectionHeader(title: "Weekly Overview", actionTitle: "See all") {}
            HStack(alignment: .bottom, spacing: 10) {
                WeeklyBarChart(bars: viewModel.weeklyBars, maxValue: viewModel.maxAmount)
            }
        }
    }

    private var statsRow: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
            StatTile(icon: "sum", value: viewModel.totalWater, label: "Total")
            StatTile(icon: "chart.bar", value: viewModel.averagePerDay, label: "Avg/Day")
            StatTile(icon: "flame.fill", value: viewModel.streak, label: "Streak", tint: Color.hydraWarning)
        }
    }

    private var monthlyCard: some View {
        Card {
            SectionHeader(title: "Monthly Overview")
            HStack(alignment: .bottom, spacing: 4) {
                MonthlyBarChart(bars: viewModel.monthlyBars, maxValue: viewModel.maxAmount)
            }
        }
    }
}

#Preview {
    HistoryScreen()
        .environment(AppRouter())
}
