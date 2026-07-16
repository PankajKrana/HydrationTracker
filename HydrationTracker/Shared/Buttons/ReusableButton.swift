import SwiftUI

struct ReusableButton: View {
    let title: String
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundStyle(foregroundColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(backgroundColor)
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
}
