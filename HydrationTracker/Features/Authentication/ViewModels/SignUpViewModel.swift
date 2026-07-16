//
//  SignUpViewModel.swift
//  HydrationTracker
//

import SwiftUI

@Observable
final class SignUpViewModel {

    var email = ""
    var password = ""
    var rememberMe = false

    
    var isEmailValid: Bool { email.contains("@") && email.contains(".") }
    var isPasswordValid: Bool { password.count >= 6 }
    var canSubmit: Bool { isEmailValid && isPasswordValid }
}
