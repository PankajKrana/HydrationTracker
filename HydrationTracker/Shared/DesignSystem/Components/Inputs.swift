//
//  Inputs.swift
//  HydrationTracker
//

import SwiftUI

/// Rounded, filled text field with focus highlight.
struct FilledTextField: View {
    var placeholder: String
    @Binding var text: String
    var icon: String? = nil
    var isSecure: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            if let icon {
                Image(systemName: icon)
                    .foregroundStyle(Color.hydraPrimary)
            }
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .font(.body)
        .foregroundStyle(Color.hydraInk)
        .padding(.horizontal, Spacing.s2)
        .frame(height: 56)
        .background(Color.hydraGrayCard)
        .clipShape(RoundedRectangle(cornerRadius: Radius.md))
        .overlay(
            RoundedRectangle(cornerRadius: Radius.md)
                .stroke(text.isEmpty ? Color.clear : Color.hydraPrimary.opacity(0.5), lineWidth: 1.5)
        )
        .animation(.gentle, value: text.isEmpty)
    }
}
