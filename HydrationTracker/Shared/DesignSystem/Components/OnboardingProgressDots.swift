//
//  OnboardingProgressDots.swift
//  HydrationTracker
//

import SwiftUI

struct OnboardingProgressDots: View {
    let total: Int
    let current: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Capsule()
                    .fill(index <= current ? Color.hydraPrimary : Color.hydraGrayCard)
                    .frame(width: index == current ? 28 : 10, height: 10)
                    .animation(.gentle, value: current)
            }
        }
    }
}
