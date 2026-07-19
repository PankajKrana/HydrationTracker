//
//  SettingScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct SettingScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var viewModel = SettingViewModel()

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()

            ScrollView {
                VStack(spacing: Spacing.s4) {
                    header
                    profileCard
                    goalCard
                    remindersCard
                    dataCard
                    aboutCard
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, Spacing.screen)
                .padding(.top, 12)
                .scrollIndicators(.hidden)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient.hydra)
                    .frame(width: 56, height: 56)
                    .softShadow()
                Image(systemName: "person.fill")
                    .font(.system(size: 26))
                    .foregroundStyle(.white)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text("Your Profile")
                    .font(.subtitle)
                    .foregroundStyle(Color.hydraInk)
                Text("Manage your preferences")
                    .font(.body)
                    .foregroundStyle(Color.hydraInkSecondary)
            }
            Spacer()
        }
    }

    private var profileCard: some View {
        Card {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(LinearGradient.hydra)
                        .frame(width: 72, height: 72)
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(.white)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.name)
                        .font(.subtitle)
                        .foregroundStyle(Color.hydraInk)
                    Text("Hydration enthusiast")
                        .font(.bodySmall)
                        .foregroundStyle(Color.hydraInkSecondary)
                }
                Spacer()
                IconButton(systemImage: "pencil", tint: Color.hydraPrimary) {}
            }
        }
    }

    private var goalCard: some View {
        Card {
            SectionHeader(title: "Daily Goal")
            HStack {
                SettingRow(icon: "target", title: "Target", subtitle: viewModel.goalText) {
                    Stepper("", value: $viewModel.dailyGoalLiters, in: 0.5...6.0, step: 0.1)
                        .labelsHidden()
                        .onChange(of: viewModel.dailyGoalLiters) { _, newValue in
                            UserDefaults.standard.set(newValue, forKey: StorageKey.dailyGoalLiters)
                        }
                }
            }
        }
    }

    private var remindersCard: some View {
        Card {
            SectionHeader(title: "Reminders")
            ToggleRow(icon: "bell.fill", title: "Drink Reminders", isOn: $viewModel.remindersOn, tint: Color.hydraWarning)
            ToggleRow(icon: "app.badge.fill", title: "Notifications", isOn: $viewModel.notificationsOn, tint: Color.hydraPrimary)
            ToggleRow(icon: "speaker.wave.2.fill", title: "Sounds", isOn: $viewModel.soundsOn, tint: Color.hydraCyan)
        }
    }

    private var dataCard: some View {
        Card {
            SectionHeader(title: "Data & Sync")
            SettingRow(icon: "heart.fill", tint: Color.pink, title: "Apple Health Sync") {
                Toggle("", isOn: $viewModel.healthSyncOn).labelsHidden()
            }
            NavRow(icon: "clock.arrow.circlepath", tint: Color.hydraNavy, title: "History") {
                router.goToHistory()
            }
            NavRow(icon: "chart.bar.xaxis", tint: Color.hydraSky, title: "Insights") {
                router.goToInsight()
            }
        }
    }

    private var aboutCard: some View {
        Card {
            SectionHeader(title: "About")
            NavRow(icon: "star.fill", tint: Color.yellow, title: "Rate the App") {}
            NavRow(icon: "lock.fill", tint: Color.gray, title: "Privacy Policy") {}
            SettingRow(icon: "info.circle.fill", title: "Version", subtitle: "1.0.0") {}
        }
    }

    private var signOutButton: some View {
        Button {
            UserDefaults.standard.set(false, forKey: StorageKey.isLoggedIn)
            router.goToOnboarding()
        } label: {
            Text("Sign Out")
                .font(.emphasis)
                .foregroundStyle(Color.red)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.red.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
        }
    }
}

// MARK: - Subcomponents

struct NavRow: View {
    let icon: String
    var tint: Color = Color.hydraPrimary
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(tint))
                Text(title)
                    .font(.body)
                    .foregroundStyle(Color.hydraInk)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.hydraInkTertiary)
            }
            .padding(.vertical, 12)
        }
        .buttonStyle(.plain)
    }
}

struct ToggleRow: View {
    let icon: String
    let title: String
    @Binding var isOn: Bool
    var tint: Color

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(Circle().fill(tint))
            Text(title)
                .font(.body)
                .foregroundStyle(Color.hydraInk)
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(tint)
        }
        .padding(.vertical, 12)
    }
}


#Preview {
    SettingScreen()
        .environment(AppRouter())
}
