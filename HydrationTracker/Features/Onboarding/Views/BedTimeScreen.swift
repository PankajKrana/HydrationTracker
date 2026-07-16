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
                    .foregroundStyle(.black)
                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()

                Text("BedTime")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Spacer()

                HStack(spacing: 0) {
                    Image(.human)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 290)

                    Picker("", selection: $vm.hours) {
                        ForEach(1...12, id: \.self) {
                            Text("\($0)")
                        }
                    }

                    Text(":")
                        .font(.largeTitle)

                    Picker("", selection: $vm.minutes) {
                        ForEach(0..<60, id: \.self) {
                            Text(String(format: "%02d", $0))
                        }
                    }
                }
                .pickerStyle(.wheel)

                Spacer()

                Picker("", selection: $vm.meridiem) {
                    ForEach(BedTimeViewModel.Meridiem.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.wheel)
                .padding(.horizontal, 20)

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
