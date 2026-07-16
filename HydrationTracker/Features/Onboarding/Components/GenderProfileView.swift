import SwiftUI

struct GenderProfileView: View {
    let image: ImageResource
    let gender: Gender

    @Binding var selectedGender: Gender?

    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                selectedGender = gender
            }
        } label: {
            VStack(spacing: 12) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .saturation(selectedGender == gender || selectedGender == nil ? 1 : 0)
                    .opacity(opacity)
            }
        }
        .buttonStyle(.plain)
    }

    private var opacity: Double {
        if selectedGender == nil {
            return 1.0
        }
        return selectedGender == gender ? 1.0 : 0.35
    }
}
