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
            appBg
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    headerView

                    weeklyCard

                    statsRow

                    Text("Today's Timeline")
                        .font(.title3.bold())

                    ForEach(viewModel.todayEntries) { entry in
                        TimelineRow(entry: entry)
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("Water Timeline")
        .navigationBarBackButtonHidden(true)
    }
}

private extension HistoryScreen {

    var headerView: some View {
        HStack {
            Image(systemName: "drop.fill")
                .font(.title)
                .foregroundStyle(.blue)

            VStack(alignment: .leading) {
                Text("Your Hydration")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("Last 7 Days")
                    .font(.title.bold())
            }

            Spacer()

            Image(systemName: "calendar")
                .font(.title2)
                .foregroundStyle(.primary)
                .padding(12)
                .background(.regularMaterial)
                .clipShape(Circle())
        }
    }

    var weeklyCard: some View {
        VStack(alignment: .leading, spacing: 14) {

            HStack {
                Text("Weekly Overview")
                    .font(.headline)

                Spacer()

                Text("Goal \(Int(viewModel.goal * 1000)) ml")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            HStack(alignment: .bottom, spacing: 10) {

                ForEach(viewModel.weekData) { day in

                    VStack(spacing: 8) {

                        Capsule()
                            .fill(
                                day.isToday
                                ? LinearGradient(colors: [.blue, .cyan],
                                                 startPoint: .bottom,
                                                 endPoint: .top)
                                : LinearGradient(colors: [.blue.opacity(0.35),
                                                          .blue.opacity(0.15)],
                                                 startPoint: .bottom,
                                                 endPoint: .top)
                            )
                            .frame(
                                height: max(
                                    28,
                                    CGFloat(day.amount / viewModel.maxAmount) * 120
                                )
                            )

                        Text(day.weekday)
                            .font(.caption)
                            .foregroundStyle(day.isToday ? .blue : .secondary)

                        Text("\(day.date)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    var statsRow: some View {

        HStack(spacing: 12) {

            StatCard(
                title: "Total",
                value: viewModel.totalWater,
                icon: "sum"
            )

            StatCard(
                title: "Avg / Day",
                value: viewModel.averagePerDay,
                icon: "chart.bar"
            )

            StatCard(
                title: "Streak",
                value: viewModel.streak,
                icon: "flame"
            )
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(.blue)
            Text(value)
                .font(.title3.bold())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct TimelineRow: View {
    let entry: IntakeEntry
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "drop.fill")
                .font(.title3)
                .foregroundStyle(.white)
                .padding(10)
                .background(Circle().fill(.blue))
            VStack(alignment: .leading) {
                Text(entry.title)
                    .font(.headline)
                Text(entry.time)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(entry.amount)
                .font(.headline)
                .foregroundStyle(.blue)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HistoryScreen()
        .environment(AppRouter())
}
