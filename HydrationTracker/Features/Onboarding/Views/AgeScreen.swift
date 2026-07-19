//
//  AgeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct AgeScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var age = 0
    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()
            
            VStack(spacing: 3){
                HStack {

                    CustomBackButton {
                        router.pop()
                    }

                    Spacer()

                    Button("Skip") {
                        router.push(.weight)
                    }
                    .font(.headline)
                    .foregroundStyle(.primary)

                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()
                Text("How old are\nyou?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Spacer()
                AgePickerView(age: $age)
                
                Spacer()
                
                ReusableButton(title: "Continue") {
                    router.push(.weight)
                }
            }
            
        }
    }
}




#Preview {
    AgeScreen()
        .environment(AppRouter())
}
