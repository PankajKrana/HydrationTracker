//
//  SettingRow.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

struct SettingRow<Trailing: View>: View {
    let icon: String
    var tint: Color = .blue
    let title: String
    var subtitle: String? = nil
    @ViewBuilder var trailing: () -> Trailing

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background(Circle().fill(tint.gradient))
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline.weight(.medium))
                if let subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer(minLength: 0)
            trailing()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
    }
}

struct SettingNavRow: View {
    let icon: String
    var tint: Color = .blue
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            SettingRow(icon: icon, tint: tint, title: title) {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.tertiary)
            }
        }
        .buttonStyle(.plain)
    }
}
