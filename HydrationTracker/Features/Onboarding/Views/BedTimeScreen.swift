//
//  BedTimeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct BedTimeScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var vm = BedTimeViewModel()

    var body: some View {
        @Bindable var vm = vm
        ZStack {
            appBg.ignoresSafeArea()

            VStack(spacing: 2) {
                HStack {
                    CustomBackButton {
                        router.pop()
                    }

                    Spacer()

                    Button("Skip") {
                        router.push(.dailyGoal)
                    }
                    .font(.headline)
                    .foregroundStyle(.primary)
                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()

                Text("BedTime")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Spacer()

                Image(.human)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 290)

                DatePicker("Bedtime", selection: $vm.bedtime, displayedComponents: .hourAndMinute)
                    .pickerStyle(.wheel)
                    .labelsHidden()

                Spacer()

                ReusableButton(title: "Continue") {
                    router.push(.dailyGoal)
                }
            }
            
        }
    }
}

#Preview {
    BedTimeScreen()
        .environment(AppRouter())
}
