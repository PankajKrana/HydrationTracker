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
            appBg
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    headerView

                    scoreCard

                    statsRow

                    weeklyCard

                    Text("Smart Insights")
                        .font(.title3.bold())

                    ForEach(viewModel.insights) { item in
                        InsightCard(item: item)
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("Insights")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

extension InsightScreen {
    private var headerView: some View {
           HStack {

               VStack(alignment: .leading, spacing: 2) {

                   Text("Your Hydration")
                       .font(.subheadline)
                       .foregroundStyle(.secondary)

                   Text("Insights")
                       .font(.largeTitle.bold())
               }

               Spacer()

               Image(systemName: "chart.bar.xaxis")
                   .font(.title2)
                   .foregroundStyle(.primary)
                   .padding(12)
                   .background(.regularMaterial)
                   .clipShape(Circle())
           }
       }
    
    private var scoreCard: some View {

           VStack(spacing: 16) {

               ZStack {

                   Circle()
                       .stroke(.quaternary, lineWidth: 16)

                   Circle()
                       .trim(from: 0, to: viewModel.animate ? CGFloat(viewModel.score) / 100 : 0)
                       .stroke(
                           AngularGradient(
                               colors: [.cyan, .blue, .indigo],
                               center: .center
                           ),
                           style: StrokeStyle(
                               lineWidth: 16,
                               lineCap: .round
                           )
                       )
                       .rotationEffect(.degrees(-90))
                       .animation(.easeOut(duration: 1.2), value: viewModel.animate)

                   VStack(spacing: 2) {

                       Text("\(viewModel.animate ? viewModel.score : 0)")
                           .font(.system(size: 52, weight: .bold))
                           .contentTransition(.numericText())
                           .animation(.easeOut(duration: 1.2), value: viewModel.animate)

                       Text("Hydration Score")
                           .font(.subheadline)
                           .foregroundStyle(.secondary)
                   }
               }
               .frame(width: 200, height: 200)

               Text(
                   viewModel.score >= 75
                   ? "You're well hydrated — nice work!"
                   : "Room to improve this week"
               )
               .font(.headline)
               .foregroundStyle(.blue)
           }
           .frame(maxWidth: .infinity)
           .padding(.vertical, 24)
           .background(.regularMaterial)
           .clipShape(RoundedRectangle(cornerRadius: 24))
       }
    
    private var statsRow: some View {

            HStack(spacing: 12) {

                StatCard(
                    title: "Avg / Day",
                    value: String(format: "%.1fL", viewModel.average),
                    icon: "chart.bar.fill"
                )

                StatCard(
                    title: "Goal Met",
                    value: "\(viewModel.goalDays)/7",
                    icon: "checkmark.seal.fill"
                )

                StatCard(
                    title: "Total",
                    value: String(format: "%.1fL", viewModel.total),
                    icon: "drop.fill"
                )
            }
        }
    
    private var weeklyCard: some View {

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
                                    ? LinearGradient(
                                        colors: [.blue, .cyan],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                    : LinearGradient(
                                        colors: [
                                            .blue.opacity(0.35),
                                            .blue.opacity(0.15)
                                        ],
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .frame(
                                    height: viewModel.animate
                                    ? max(
                                        28,
                                        CGFloat(day.amount / viewModel.maxAmount) * 120
                                    )
                                    : 28
                                )
                                .animation(
                                    .spring(response: 0.7, dampingFraction: 0.8)
                                    .delay(0.1),
                                    value: viewModel.animate
                                )

                            Text(day.weekday)
                                .font(.caption)
                                .foregroundStyle(
                                    day.isToday ? .blue : .secondary
                                )

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
}

#Preview {
    InsightScreen()
        .environment(AppRouter())
}
