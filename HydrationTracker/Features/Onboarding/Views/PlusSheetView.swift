//
//  PlusSheetView.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 17/07/26.
//

import SwiftUI

struct PlusSheetView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var selectedAmounts: Set<String> = []
    var body: some View {
        VStack {
            Text("Log Drink")
                .font(.title2)
                .multilineTextAlignment(.center)

            Spacer()

            HStack {
                VStack {
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "100 ml")
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "300 ml")
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "500 ml")

                }

                VStack {
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "200 ml")
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "400 ml")
                    LogDrinkView(selectedAmounts: $selectedAmounts, text: "600 ml")

                }

            }

            Spacer()

            ReusableButton(title: "Add Water") {
                // action
            }


        }
        .padding()
    }
}



struct LogDrinkView: View {
    @Binding var selectedAmounts: Set<String>
    let text: String

    var body: some View {
        VStack {

            Button {
                if selectedAmounts.contains(text) {
                    selectedAmounts.remove(text)
                } else {
                    selectedAmounts.insert(text)
                }
            } label: {
                VStack {
                    Image(.waterBottle)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)

                    Text(text)
                }
            }
        }

        .padding()
        .background(selectedAmounts.contains(text) ? .blue.opacity(0.3) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
