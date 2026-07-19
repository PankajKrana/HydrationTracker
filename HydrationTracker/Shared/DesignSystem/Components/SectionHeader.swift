//
//  SectionHeader.swift
//  HydrationTracker
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(title)
                .font(.title)
                .foregroundStyle(Color.hydraInk)
            Spacer()
            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(.caption)
                    .foregroundStyle(Color.hydraPrimary)
            }
        }
    }
}
