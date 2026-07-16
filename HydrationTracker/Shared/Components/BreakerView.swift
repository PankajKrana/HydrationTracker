import SwiftUI

struct BreakerView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 0.5)
            Text("OR")
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 0.5)
        }
        .padding()
        .foregroundStyle(.gray)
    }
}
