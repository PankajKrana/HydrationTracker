import SwiftUI

struct SkipButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Skip")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
//                .padding(.horizontal, 14)
//                .padding(.vertical, 8)
//                .frame(minHeight: 44)
//                .background(.regularMaterial)
//                .clipShape(Capsule())
        }
    }
}
