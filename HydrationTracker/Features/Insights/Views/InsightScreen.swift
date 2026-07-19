//
//  InsightScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct InsightScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = InsightViewModel()

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: Spacing.s4) {
                    headerView
                    scoreCard
                    statsRow
                    weeklyCard
                    Text("Smart Insights")
                        .font(.title)
                        .foregroundStyle(Color.hydraInk)
                    ForEach(viewModel.insights) { item in
                        InsightCard(item: item)
                    }
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, Spacing.screen)
                .padding(.top, 12)
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("Insights")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { viewModel.onAppear() }
    }

    private var headerView: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient.hydra)
                    .frame(width: 56, height: 56)
                    .softShadow()
                Image(systemName: "chart.bar.xaxis")
                    .font(.system(size: 26))
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Your Hydration")
                    .font(.subtitle)
                    .foregroundStyle(Color.hydraInk)
                Text("Insights")
                    .font(.body)
                    .foregroundStyle(Color.hydraInkSecondary)
            }
            Spacer()
            IconButton(systemImage: "heart.fill") {}
        }
    }

    private var scoreCard: some View {
        Card(padding: Spacing.s4, radius: Radius.xl) {
            VStack(spacing: 16) {
                WaterProgressRing(progress: Double(viewModel.score) / 100, lineWidth: 22) {
                    VStack(spacing: 2) {
                        Text("\(viewModel.score)")
                            .font(.hero)
                            .foregroundStyle(Color.hydraInk)
                        Text("Hydration Score")
                            .font(.caption)
                            .foregroundStyle(Color.hydraInkSecondary)
                    }
                }
                .frame(width: 180, height: 180)

                Text(viewModel.score >= 75 ? "You're well hydrated — nice work!" : "Room to improve this week")
                    .font(.emphasis)
                    .foregroundStyle(Color.hydraPrimary)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    private var statsRow: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
            StatTile(icon: "chart.bar.fill", value: String(format: "%.1fL", viewModel.average), label: "Avg/Day")
            StatTile(icon: "checkmark.seal.fill", value: "\(viewModel.goalDays)/7", label: "Goal Met")
            StatTile(icon: "drop.fill", value: String(format: "%.1fL", viewModel.total), label: "Total")
        }
    }

    private var weeklyCard: some View {
        Card {
            SectionHeader(title: "Weekly Overview")
            HStack(alignment: .bottom, spacing: 10) {
                WeeklyBarChart(bars: viewModel.weeklyBars, maxValue: viewModel.maxAmount)
            }
        }
    }
}

#Preview {
    InsightScreen()
        .environment(AppRouter())
}
