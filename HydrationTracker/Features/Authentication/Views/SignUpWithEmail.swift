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

                Text("Create Account")
                    .font(.largeTitle)

                Text("Sign up to start tracking")
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

                ReusableButton(title: "Create Account") {
                    router.push(.onboardingGender)
                }
                .disabled(!vm.canSubmit)
            }
        }
    }
}

#Preview {
    SignUpWithEmail()
        .environment(AppRouter())
}
