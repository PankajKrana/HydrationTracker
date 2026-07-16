import SwiftUI

struct UnitPicker: View {
    @Binding var selectedUnit: HeightViewModel.Unit

    var body: some View {
        HStack(spacing: 0) {
            Button {
                selectedUnit = .feet
            } label: {
                Text("ft in")
                    .foregroundStyle(
                        selectedUnit == .feet ? .black : .gray
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }

            Button {
                selectedUnit = .cm
            } label: {
                Text("cm")
                    .foregroundStyle(
                        selectedUnit == .cm ? .black : .gray
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
        }
        .background(.white.opacity(0.9))
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(.gray.opacity(0.15))
        }
        .frame(width: 140)
    }
}
