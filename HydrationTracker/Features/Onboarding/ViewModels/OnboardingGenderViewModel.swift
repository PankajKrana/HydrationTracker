//
//  OnboardingGenderViewModel.swift
//  HydrationTracker
//

import SwiftUI

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

@Observable
final class OnboardingGenderViewModel {

    var selectedGender: Gender? = nil

    func select(_ gender: Gender) {
        withAnimation(.easeInOut) { selectedGender = gender }
    }

    func isSelected(_ gender: Gender) -> Bool { selectedGender == gender }
}
