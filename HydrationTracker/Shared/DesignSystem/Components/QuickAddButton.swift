//
//  QuickAddButton.swift
//  HydrationTracker
//

import SwiftUI

/// Pill preset used in the Home quick-add row (+100 / +250 / +500 / +1L).
struct QuickAddButton: View {
    let label: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.emphasis)
                .foregroundStyle(Color.hydraInk)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.hydraCard)
                .clipShape(RoundedRectangle(cornerRadius: Radius.md))
                .cardShadow()
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
