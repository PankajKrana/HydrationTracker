//
//  ButtonStyles.swift
//  HydrationTracker
//

import SwiftUI

/// Press-scale feedback shared by every button in the design system.
struct ScaleButtonStyle: ButtonStyle {
    var scale: CGFloat = 0.97

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
            .animation(.snappy, value: configuration.isPressed)
    }
}
