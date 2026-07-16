import SwiftUI

struct SocialLoginButton<Icon: View>: View {
    let action: () -> Void
    @ViewBuilder let icon: () -> Icon

    var body: some View {
        Button(action: action) {
            icon()
                .frame(width: 24, height: 24)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 10)
        }
    }
}
