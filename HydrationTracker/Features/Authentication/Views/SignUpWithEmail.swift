//
//  SignUpWithEmail.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct SignUpWithEmail: View {
    enum Mode { case signUp, login }

    @Environment(AppRouter.self) private var router
    @State private var vm = SignUpViewModel()
    var mode: Mode = .signUp

    private var title: String { mode == .signUp ? "Create Account" : "Welcome Back" }
    private var subtitle: String { mode == .signUp ? "Sign up to start tracking" : "Log in to continue your streak" }
    private var cta: String { mode == .signUp ? "Create Account" : "Log In" }

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            appBg.ignoresSafeArea()

            ScrollView {
                VStack(spacing: Spacing.s3) {
                    // Header
                    ZStack {
                        Circle()
                            .fill(LinearGradient.hydra)
                            .frame(width: 88, height: 88)
                            .softShadow()
                        Image(systemName: "drop.fill")
                            .font(.system(size: 38))
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 24)

                    VStack(spacing: 8) {
                        Text(title)
                            .font(.hero)
                            .foregroundStyle(Color.hydraInk)
                        Text(subtitle)
                            .font(.body)
                            .foregroundStyle(Color.hydraInkSecondary)
                    }

                    // Card with inputs
                    Card {
                        VStack(alignment: .leading, spacing: Spacing.s2) {
                            Text("Email")
                                .font(.caption)
                                .foregroundStyle(Color.hydraInkSecondary)
                            FilledTextField(placeholder: "you@example.com", text: $vm.email, icon: "envelope.fill")

                            Text("Password")
                                .font(.caption)
                                .foregroundStyle(Color.hydraInkSecondary)
                            FilledTextField(placeholder: "••••••••", text: $vm.password, icon: "lock.fill", isSecure: true)

                            Toggle(isOn: $vm.rememberMe) {
                                Text("Remember me")
                                    .font(.bodySmall)
                                    .foregroundStyle(Color.hydraInkSecondary)
                            }
                            .tint(Color.hydraPrimary)
                            .padding(.top, 4)
                        }
                    }
                    .padding(.horizontal, Spacing.s3)

                    PrimaryButton(title: cta) {
                        guard vm.canSubmit else { return }
                        UserDefaults.standard.set(vm.email, forKey: StorageKey.userEmail)
                        UserDefaults.standard.set(vm.displayName, forKey: StorageKey.userName)
                        UserDefaults.standard.set(vm.rememberMe, forKey: StorageKey.isLoggedIn)
                        if mode == .login {
                            UserDefaults.standard.set(true, forKey: StorageKey.isLoggedIn)
                            router.reset(to: .content)
                        } else {
                            router.push(.onboardingGender)
                        }
                    }
                    .disabled(!vm.canSubmit)
                    .opacity(vm.canSubmit ? 1 : 0.55)
                    .padding(.horizontal, Spacing.s3)

                    // Divider
                    HStack {
                        Rectangle().fill(Color.hydraGrayCard).frame(height: 1)
                        Text("or")
                            .font(.caption)
                            .foregroundStyle(Color.hydraInkTertiary)
                        Rectangle().fill(Color.hydraGrayCard).frame(height: 1)
                    }
                    .padding(.horizontal, Spacing.s3)

                    VStack(spacing: 12) {
                        SocialButton(icon: "applelogo", label: "Continue with Apple") {}
                        SocialButton(icon: "googleIcon", label: "Continue with Google", isImageAsset: true) {}
                    }
                    .padding(.horizontal, Spacing.s3)

                    Button {
                        mode == .signUp ? router.goToLogin() : router.pop()
                    } label: {
                        HStack(spacing: 4) {
                            Text(mode == .signUp ? "Already have an account?" : "New here?")
                                .foregroundStyle(Color.hydraInkSecondary)
                            Text(mode == .signUp ? "Log in" : "Create one")
                                .foregroundStyle(Color.hydraPrimary)
                                .fontWeight(.semibold)
                        }
                        .font(.bodySmall)
                    }
                    .padding(.top, 4)

                    Spacer(minLength: 24)
                }
            }
            .scrollIndicators(.hidden)

            VStack {
                HStack {
                    IconButton(systemImage: "chevron.left") { router.pop() }
                    Spacer()
                }
                .padding(.horizontal, Spacing.s3)
                .padding(.top, 8)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SignUpWithEmail()
        .environment(AppRouter())
}
