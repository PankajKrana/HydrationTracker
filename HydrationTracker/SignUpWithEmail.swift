//
//  SignUpWithEmail.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct SignUpWithEmail: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = true
    
    var body: some View {
        
        ZStack {
            appBg.ignoresSafeArea()
            
            VStack(spacing: 24) {
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
                    EmailTextField(email: $email)

                    Text("Password")
                    PasswordTextField(password: $password)
                    
                    Centerpart(isActive: $rememberMe)

                }
                .padding(.horizontal)
                
                

                
                ReusableButton(title: "Log In") {
                    // action
                }
                
                bottonbar

            }
            
        }
    }
    var bottonbar: some View {
        HStack {
            Text("Don't have any account?")
            Button {
                
            } label: {
                Text("Create Account")
                    .underline()
                
            }
        }
        .multilineTextAlignment(.center)
    }
}


struct Centerpart: View {
    @Binding var isActive: Bool

    var body: some View {
        HStack {
            Button {
                isActive.toggle()
            } label: {
                Image(systemName: isActive
                      ? "checkmark.square.fill"
                      : "square")
                    .foregroundStyle(.gray)
            }

            Text("Remember Me")

            Spacer()

            Button {

            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.black)
                    .underline()
            }
        }
    }
}
#Preview {
    SignUpWithEmail()
}
