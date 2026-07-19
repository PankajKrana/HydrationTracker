//
//  InsightCard.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 19/07/26.
//

import SwiftUI

struct InsightCard: View {
    let item: InsightItem
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: item.icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 46, height: 46)
                .background(Circle().fill(item.tint.gradient))
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                Text(item.message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
