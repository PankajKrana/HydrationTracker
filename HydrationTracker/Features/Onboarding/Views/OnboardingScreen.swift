//
//  OnboardingScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct OnboardingScreen: View {
    @Environment(AppRouter.self) private var router

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
                    router.push(.signUp)
                }
                
                BreakerView()
                
                SocialLoginButton(action: {}) {
                    Image(systemName: "applelogo")
                        .font(.title2)
                        .foregroundStyle(.primary)
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



#Preview {
    OnboardingScreen()
        .environment(AppRouter())
}
