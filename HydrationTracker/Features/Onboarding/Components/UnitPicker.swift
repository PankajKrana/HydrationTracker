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
                        selectedUnit == .feet ? .primary : .secondary
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }

            Button {
                selectedUnit = .cm
            } label: {
                Text("cm")
                    .foregroundStyle(
                        selectedUnit == .cm ? .primary : .secondary
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
        }
        .background(.regularMaterial)
        .clipShape(Capsule())
        .overlay {
            Capsule()
                .stroke(.gray.opacity(0.15))
        }
        .frame(width: 140)
    }
}
