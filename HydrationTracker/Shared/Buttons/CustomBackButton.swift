import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action){
            Circle()
                .fill(.regularMaterial)
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.primary)
                }
        }
    }
}
