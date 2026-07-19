//
//  DailyGoalScreen .swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct DailyGoalScreen_: View {
    @Environment(AppRouter.self) private var router

    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()
            
            VStack(spacing: 2) {
                
                HStack {

                    CustomBackButton {
                        router.pop()
                    }

                    Spacer()

                    Button("Skip") {
                        UserDefaults.standard.set(3.0, forKey: StorageKey.dailyGoalLiters)
                        router.reset(to: .home)
                    }
                    .font(.headline)
                    .foregroundStyle(.primary)

                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
                Text("Your daily goal")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Image(.waterBottle)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text("3.1L")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Text("per day")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("How to calculate this")
                    
                
                HStack {
                    VStack(spacing: 20) {
                        Text("Body weight")
                        Text("Activity level")
                    }
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Text("2.6L")
                        Text("+0.3L")
                    }
                }
                .padding()
                
                Spacer()
                
                ReusableButton(title: "Looks good!") {
                    UserDefaults.standard.set(3.1, forKey: StorageKey.dailyGoalLiters)
                    UserDefaults.standard.set(true, forKey: StorageKey.isLoggedIn)
                    router.reset(to: .content)
                }

            }
            

        }
    }
    
}

#Preview {
    DailyGoalScreen_()
        .environment(AppRouter())
}
