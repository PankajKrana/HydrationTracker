//
//  AgeScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct AgeScreen: View {
    @State private var age = 0
    var body: some View {
        ZStack {
            appBg.ignoresSafeArea()
            
            VStack(spacing: 3){
                HStack {

                    CustomBackButton {

                    }

                    Spacer()

                    Button("Skip") {

                    }
                    .font(.headline)
                    .foregroundStyle(.black)

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
                    // action
                }
            }
        }
    }
}




struct AgePickerView: View {

    @Binding  var age: Int

    var body: some View {

        VStack(spacing: 30) {

            HStack {
                Text("\(age)")
                    .font(.system(size: 50, weight: .bold))
                
                Text("years")
                    .foregroundStyle(.secondary)
            }

            Picker("", selection: $age) {

                ForEach(1...100, id: \.self) { value in

                    Text("\(value)")
                        .font(.title)
                        .tag(value)

                }

            }
            .pickerStyle(.wheel)
//            .frame(height: 180)
//            .clipped()

        }
    }
}
#Preview {
    AgeScreen()
}
