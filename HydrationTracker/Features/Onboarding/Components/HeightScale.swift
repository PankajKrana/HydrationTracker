import SwiftUI

struct HeightScale: View {
    @Binding var selectedHeight: Int?

    private let heights = Array((36...84).reversed())

    var body: some View {
        ZStack(alignment: .leading) {
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(heights, id: \.self) { value in
                        HStack(spacing: 10) {
                            Rectangle()
                                .fill(.gray.opacity(0.25))
                                .frame(
                                    width: value % 12 == 0 ? 45 : 22,
                                    height: 1
                                )

                            if value % 12 == 0 {
                                Text("\(value / 12)")
                                    .font(.title3)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .frame(height: 10)
                        .id(value)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedHeight)

            // MARK: Fixed Indicator
            HStack(spacing: 8) {
                Image(systemName: "arrow.left")
                    .font(.title2)

                Text("\((selectedHeight ?? 5) / 12)")
                    .font(.title2)
            }
            .offset(x: -55, y: -130)
        }
    }
}
