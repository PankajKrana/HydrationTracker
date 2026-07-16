//
//  SignUpWithEmail.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct SignUpWithEmail: View {
    @Environment(AppRouter.self) private var router
    @State private var vm = SignUpViewModel()

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            appBg.ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()
                Image(.waterdrop)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)

                Text("Welcome Back")
                    .font(.largeTitle)

                Text("Sign up to protect your device")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Email")
                    EmailTextField(email: $vm.email)

                    Text("Password")
                    PasswordTextField(password: $vm.password)

                    Centerpart(isActive: $vm.rememberMe)
                }
                .padding(.horizontal)

                Spacer()

                ReusableButton(title: "Log In") {
                    router.push(.onboardingGender)
                }
                .disabled(!vm.canSubmit)

                bottonbar
            }
        }
    }

    var bottonbar: some View {
        HStack {
            Text("Don't have any account?")
            Button {} label: {
                Text("Create Account")
                    .underline()
            }
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    SignUpWithEmail()
        .environment(AppRouter())
}
