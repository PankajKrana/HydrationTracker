import SwiftUI

struct SkipButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Skip")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(.regularMaterial)
                .clipShape(Capsule())
        }
    }
}
