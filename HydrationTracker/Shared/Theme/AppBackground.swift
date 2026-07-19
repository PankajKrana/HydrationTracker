import SwiftUI

extension View {
    /// Premium hydration background: soft blue-to-white vertical gradient.
    @ViewBuilder
    var appBg: some View {
        LinearGradient(
            colors: [Color.hydraPrimary.opacity(0.16), Color.hydraBg, Color.white],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

/// Standalone background view for screens that need it as a layer.
struct AppBackground: View {
    var body: some View {
        LinearGradient(
            colors: [Color.hydraPrimary.opacity(0.16), Color.hydraBg, Color.white],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
