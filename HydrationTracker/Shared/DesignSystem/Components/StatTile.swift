//
//  StatTile.swift
//  HydrationTracker
//

import SwiftUI

struct StatTile: View {
    let icon: String
    let value: String
    let label: String
    var tint: Color = Color.hydraPrimary

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.s1) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(LinearGradient(colors: [tint, tint.opacity(0.75)], startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: Radius.sm))

            Text(value)
                .font(.subtitle)
                .foregroundStyle(Color.hydraInk)
            Text(label)
                .font(.caption)
                .foregroundStyle(Color.hydraInkSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Spacing.s2)
        .background(Color.hydraCard)
        .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
        .cardShadow()
    }
}
