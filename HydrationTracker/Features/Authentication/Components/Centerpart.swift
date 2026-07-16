import SwiftUI

struct Centerpart: View {
    @Binding var isActive: Bool

    var body: some View {
        HStack {
            Button {
                isActive.toggle()
            } label: {
                Image(systemName: isActive
                      ? "checkmark.square.fill"
                      : "square")
                    .foregroundStyle(.gray)
            }

            Text("Remember Me")

            Spacer()

            Button {} label: {
                Text("Forgot Password?")
                    .foregroundStyle(.black)
                    .underline()
            }
        }
    }
}
