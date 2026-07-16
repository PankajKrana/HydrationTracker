//
//  OnboardingAgeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct OnboardingAgeScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var vm = OnboardingGenderViewModel()

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            appBg.ignoresSafeArea()

            VStack(spacing: 30) {
                HStack {
                    CustomBackButton {
                        router.pop()
                    }

                    Spacer()

                    Button("Skip") {
                        router.push(.age)
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.medium)
                }
                .padding()

                Text("Choose\nYour Gender")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                GenderProfileView(
                    image: .male,
                    gender: .male,
                    selectedGender: $vm.selectedGender
                )

                GenderProfileView(
                    image: .female,
                    gender: .female,
                    selectedGender: $vm.selectedGender
                )

                ReusableButton(title: "Continue") {
                    router.push(.age)
                }
                .disabled(vm.selectedGender == nil)
            }
            
        }
    }
}

#Preview {
    OnboardingAgeScreen()
        .environment(AppRouter())
}
