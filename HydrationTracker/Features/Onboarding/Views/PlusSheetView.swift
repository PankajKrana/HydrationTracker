//
//  PlusSheetView.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 17/07/26.
//

import SwiftUI

struct PlusSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var store = IntakeStore.shared
    @State private var amountML: Int = 250

    private let presets: [(String, Int)] = [("+100", 100), ("+250", 250), ("+500", 500), ("+1L", 1000)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {
                    // Bottle + live amount
                    ZStack {
                        Image(.waterBottle)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130)
                            .scaleEffect(1 + Double(amountML) / 4000)
                            .animation(.gentle, value: amountML)
                        Text("\(amountML) ml")
                            .font(.emphasis)
                            .foregroundStyle(.white)
                            .shadow(radius: 4)
                            .offset(y: -8)
                    }
                    .frame(height: 200)

                    Text("How much did you drink?")
                        .font(.title)
                        .foregroundStyle(Color.hydraInk)

                    // Quick presets
                    HStack(spacing: 12) {
                        ForEach(presets, id: \.0) { label, ml in
                            Button {
                                amountML = ml
                            } label: {
                                Text(label)
                                    .font(.emphasis)
                                    .foregroundStyle(amountML == ml ? .white : Color.hydraInk)
                                    .padding(.vertical, 14)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        amountML == ml
                                            ? LinearGradient.hydra
                                            : LinearGradient(colors: [Color.hydraCard, Color.hydraCard], startPoint: .top, endPoint: .bottom)
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: Radius.md))
                                    .cardShadow()
                            }
                            .buttonStyle(ScaleButtonStyle())
                        }
                    }

                    // Custom amount stepper
                    Stepper(value: $amountML, in: 50...3000, step: 50) {
                        HStack(spacing: 10) {
                            Image(systemName: "slider.horizontal.3")
                            Text("\(amountML) ml")
                                .font(.emphasis)
                        }
                        .foregroundStyle(Color.hydraInk)
                    }
                    .padding(.horizontal, Spacing.s2)
                    .frame(height: 56)
                    .background(Color.hydraGrayCard)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.md))

                    PrimaryButton(title: "Add Water") {
                        store.add(amountML: amountML)
                        dismiss()
                    }

                    Spacer(minLength: 8)
                }
                .padding(Spacing.screen)
                .padding(.bottom, 24)
            }
            .navigationTitle("Add Water")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color.hydraPrimary)
                }
            }
        }
    }
}
