//
//  OnboardingAgeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct OnboardingAgeScreen: View {
    @State private var selectedGender: Gender? = nil
    
    var body: some View {
        
        ZStack {
            appBg.ignoresSafeArea()
            
            
            VStack(spacing: 30) {
                HStack {
                    CustomBackButton {
                        
                    }

                    Spacer()

                    Button("Skip") {

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
                    selectedGender: $selectedGender
                )
                
                GenderProfileView(
                    image: .female,
                    gender: .female,
                    selectedGender: $selectedGender
                )
                
                ReusableButton(title: "Continue") {
                    // Continue
                }
                .disabled(selectedGender == nil)
            }
        }
    }
    
}

struct GenderProfileView: View {
    let image: ImageResource
    let gender: Gender
    
    @Binding var selectedGender: Gender?
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedGender = gender
            }
            
        } label: {
            VStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .saturation(selectedGender == gender || selectedGender == nil ? 1 : 0)
                    .opacity(selectedGender == gender || selectedGender == nil ? 1 : 0.4)
                
                Text(gender.rawValue)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .opacity(opacity)
            }
        }
        .buttonStyle(.plain)
    }
    
    private var opacity: Double {
        if selectedGender == nil {
            return 1.0
        }
        return selectedGender == gender ? 1.0 : 0.35
    }
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

#Preview {
    OnboardingAgeScreen()
}
