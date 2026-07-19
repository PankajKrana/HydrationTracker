//
//  Cards.swift
//  HydrationTracker
//
//  Solid Card + GlassCard — 24–32px radius, soft shadow.
//

import SwiftUI

struct Card<Content: View>: View {
    var padding: CGFloat = Spacing.s3
    var radius: CGFloat = Radius.lg
    var background: Color = Color.hydraCard
    @ViewBuilder var content: () -> Content

    var body: some View {
        content()
            .padding(padding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .cardShadow()
    }
}

struct GlassCard<Content: View>: View {
    var padding: CGFloat = Spacing.s3
    var radius: CGFloat = Radius.lg
    @ViewBuilder var content: () -> Content

    var body: some View {
        content()
            .padding(padding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(Color.white.opacity(0.5), lineWidth: 1)
            )
    }
}
