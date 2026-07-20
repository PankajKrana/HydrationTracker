//
//  HomeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var store = IntakeStore.shared
    @State private var showingPlusSheet = false
    @AppStorage(StorageKey.userName) private var userName = ""
    @AppStorage(StorageKey.dailyGoalLiters) private var goalLiters: Double = 3.0

    private var displayName: String { userName.isEmpty ? "there" : userName }
    private var goalML: Int { Int(goalLiters * 1000) }
    private var todayML: Int { store.todayTotalML }
    private var remainingML: Int { max(goalML - todayML, 0) }
    private var progress: Double { goalML > 0 ? min(Double(todayML) / Double(goalML), 1) : 0 }
    private var temperature: String {
        let hour = Calendar.current.component(.hour, from: Date())
        return "\(18 + (hour % 12))°"
    }
    private var calories: String { "\(todayML / 20) kcal" }

    private let quickAdds: [(String, Int)] = [
        ("+100 ml", 100), ("+250 ml", 250), ("+500 ml", 500), ("+1L", 1000)
    ]

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()

            ScrollView {
                VStack(spacing: Spacing.s4) {
                    header
                    heroRing
                    quickAddRow
                    statsGrid
                    dailyGoalCard
                    reminderCard
                    Spacer(minLength: 90)
                }
                .padding(.horizontal, Spacing.screen)
                .padding(.top, 12)
                .scrollIndicators(.hidden)
            }

            // Floating action button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showingPlusSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(width: 60, height: 60)
                            .background(LinearGradient.hydra)
                            .clipShape(Circle())
                            .shadow(color: Color.hydraPrimary.opacity(0.45), radius: 16, y: 8)
                    }
                    .accessibilityLabel("Log Drink")
                    .padding(.trailing, 20)
                    .padding(.bottom, 70)
                }
            }
        }
        .sheet(isPresented: $showingPlusSheet) {
            PlusSheetView()
                .presentationDetents([.medium, .large])
                .presentationBackground(.regularMaterial)
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack(spacing: 14) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 46))
                .foregroundStyle(Color.hydraPrimary.gradient)
            VStack(alignment: .leading, spacing: 2) {
                Text("Hello, \(displayName)")
                    .font(.subtitle)
                    .foregroundStyle(Color.hydraInk)
                Text("Stay hydrated today")
                    .font(.bodySmall)
                    .foregroundStyle(Color.hydraInkSecondary)
            }
            Spacer()
            IconButton(systemImage: "bell", action: {})
        }
    }

    // MARK: - Hero progress ring

    private var heroRing: some View {
        Card(padding: Spacing.s4, radius: Radius.xl) {
            VStack(spacing: 16) {
                WaterProgressRing(progress: progress, lineWidth: 22) {
                    VStack(spacing: 2) {
                        Text(String(format: "%.1fL", Double(todayML) / 1000))
                            .font(.hero)
                            .foregroundStyle(Color.hydraInk)
                        Text("of \(String(format: "%.1fL", goalLiters))")
                            .font(.caption)
                            .foregroundStyle(Color.hydraInkSecondary)
                    }
                }
                .frame(width: 200, height: 200)

                Text(progress >= 1 ? "Goal reached — amazing! 🎉" : "\(remainingML) ml to go")
                    .font(.emphasis)
                    .foregroundStyle(Color.hydraPrimary)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
    }

    // MARK: - Quick add

    private var quickAddRow: some View {
        HStack(spacing: 12) {
            ForEach(quickAdds, id: \.0) { label, ml in
                QuickAddButton(label: label) {
                    store.add(amountML: ml)
                }
            }
        }
    }

    // MARK: - Stats

    private var statsGrid: some View {
        LazyVGrid(
            columns: [GridItem(.flexible()), GridItem(.flexible())],
            spacing: 14
        ) {
            StatTile(icon: "percent", value: "\(Int(progress * 100))%", label: "Progress", tint: Color.hydraPrimary)
            StatTile(icon: "flame.fill", value: "\(store.streakDays)d", label: "Streak", tint: Color.hydraWarning)
            StatTile(icon: "bolt.fill", value: calories, label: "Calories", tint: Color.hydraCyan)
            StatTile(icon: "thermometer", value: temperature, label: "Temperature", tint: Color.hydraSky)
        }
    }

    // MARK: - Daily goal

    private var dailyGoalCard: some View {
        Card {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Daily Goal")
                        .font(.emphasis)
                        .foregroundStyle(Color.hydraInk)
                    Text("Your target intake")
                        .font(.caption)
                        .foregroundStyle(Color.hydraInkSecondary)
                    Text(String(format: "%.1f L", goalLiters))
                        .font(.title)
                        .foregroundStyle(Color.hydraPrimary)
                        .padding(.top, 4)
                }
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.hydraPrimary.opacity(0.12))
                        .frame(width: 56, height: 56)
                    Image(systemName: "target")
                        .font(.title2)
                        .foregroundStyle(Color.hydraPrimary)
                }
            }
        }
    }

    // MARK: - Reminder

    @State private var reminderOn = true
    private var reminderCard: some View {
        Card {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Water Reminder")
                        .font(.emphasis)
                        .foregroundStyle(Color.hydraInk)
                    Text("Next reminder · 2:00 PM")
                        .font(.caption)
                        .foregroundStyle(Color.hydraInkSecondary)
                }
                Spacer()
                Toggle("", isOn: $reminderOn)
                    .labelsHidden()
                    .tint(Color.hydraPrimary)
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environment(AppRouter())
}
