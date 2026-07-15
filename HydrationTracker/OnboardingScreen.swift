//
//  OnboardingScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()
            
            VStack(spacing: 5) {
                HStack {
                    SideImageView(
                        mirrored: true,
                        xOffset: -30,
                        yOffset: -20
                    )

                    Spacer()

                    SideImageView(
                        xOffset: 30,
                        yOffset: 20
                    )
                }
                
                IconView(iconImage: .center)
                    
                
                Text("Start Your Day \n Hydrated")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                ReusableButton(title: "Continue with Email") {
                    // Email sign in
                }
                
                BreakerView()
                
                SocialLoginButton(action: {}) {
                    Image(systemName: "applelogo")
                        .font(.title2)
                        .foregroundStyle(.black)
                }

                
                SocialLoginButton(action: {}) {
                    Image(.googleIcon)
                        .resizable()
                        .scaledToFit()
                }

            }
            
        }
    }
    

    

}

extension View {
    @ViewBuilder
    var appBg: some View {
        LinearGradient(colors: [
            .blue.opacity(0.34), .white
        ], startPoint: .top, endPoint: .bottom)
        
    }
}


#Preview {
    OnboardingScreen()
}
