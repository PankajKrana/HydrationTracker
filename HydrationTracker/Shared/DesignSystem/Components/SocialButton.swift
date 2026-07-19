//
//  SocialButton.swift
//  HydrationTracker
//

import SwiftUI

struct SocialButton: View {
    let icon: String
    let label: String
    var isImageAsset: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if isImageAsset {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .semibold))
                }
                Text(label)
                    .font(.emphasis)
            }
            .foregroundStyle(Color.hydraInk)
            .frame(maxWidth: .infinity, minHeight: 54)
            .background(Color.hydraCard)
            .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg)
                    .stroke(Color.hydraGrayCard, lineWidth: 1)
            )
            .cardShadow()
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
