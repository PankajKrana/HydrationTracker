import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    var body: some View {
        TextField(
            "",
            text: $email,
            prompt: Text("example@youremail.com")
                .foregroundStyle(.gray)
        )
        .padding()
        .background(.gray.opacity(0.2))
        .clipShape(Capsule())
    }
}
