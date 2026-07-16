import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action){
            Circle()
                .fill(.white.opacity(0.9))
                .frame(width: 42,height: 42)
                .overlay {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
        }
    }
}
