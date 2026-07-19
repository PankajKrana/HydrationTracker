//
//  Buttons.swift
//  HydrationTracker
//
//  Primary / Ghost / Icon buttons — consistent premium styling.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var systemImage: String? = nil
    var fullWidth: Bool = true
    var height: CGFloat = 56
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if let systemImage {
                    Image(systemName: systemImage)
                }
                Text(title)
                    .font(.emphasis)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: fullWidth ? .infinity : nil, minHeight: height)
            .padding(.horizontal, Spacing.s3)
            .background(LinearGradient.hydra)
            .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg)
                    .stroke(Color.white.opacity(0.25), lineWidth: 1)
            )
        }
        .shadow(color: Color.hydraPrimary.opacity(0.35), radius: 16, x: 0, y: 8)
        .buttonStyle(ScaleButtonStyle())
    }
}

struct GhostButton: View {
    let title: String
    var foreground: Color = Color.hydraPrimary
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.emphasis)
                .foregroundStyle(foreground)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct IconButton: View {
    let systemImage: String
    var tint: Color = Color.hydraInk
    var background: Color = Color.white
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(tint)
                .frame(width: 44, height: 44)
                .background(background)
                .clipShape(Circle())
                .cardShadow()
        }
        .buttonStyle(ScaleButtonStyle())
    }
}
