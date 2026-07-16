import SwiftUI

extension View {
    @ViewBuilder
    var appBg: some View {
        LinearGradient(colors: [
            .blue.opacity(0.34), .white
        ], startPoint: .top, endPoint: .bottom)
    }
}
