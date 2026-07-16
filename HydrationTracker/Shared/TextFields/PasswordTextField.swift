import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(.gray.opacity(0.2))
            .clipShape(Capsule())
    }
}
