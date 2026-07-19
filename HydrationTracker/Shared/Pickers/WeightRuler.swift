//
//  WeightRuler.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//


import SwiftUI

struct WeightRuler: View {

    @Binding var weight: Double

    let minWeight: Double = 30
    let maxWeight: Double = 150

    private let tickSpacing: CGFloat = 12
    private let tickCount = 121

    @State private var dragOffset: CGFloat = 0
    @State private var lastOffset: CGFloat = 0
    
    private var initialOffset: CGFloat {
        -(weight - minWeight) * tickSpacing
    }

    var body: some View {

        GeometryReader { geo in

            ZStack {

                ruler(width: geo.size.width)

                indicator

            }
            .onAppear {

                dragOffset = initialOffset
                lastOffset = initialOffset

            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged { value in

                        let newOffset = lastOffset + value.translation.width
                        dragOffset = newOffset

                        let change = -newOffset / tickSpacing

                        let newWeight = min(
                            max(
                                minWeight + Double(change),
                                minWeight
                            ),
                            maxWeight
                        )

                        weight = newWeight.rounded()

                    }
                    .onEnded { _ in

                        let snappedWeight = weight.rounded()

                        weight = snappedWeight

                        withAnimation(.spring(response: 0.3,
                                              dampingFraction: 0.85)) {

                            dragOffset = -(snappedWeight - minWeight) * tickSpacing
                            lastOffset = dragOffset

                        }

                    }
            )

        }
        .frame(height: 110)

    }

}

// MARK: - Indicator

extension WeightRuler {

    private var indicator: some View {

        VStack(spacing: 8) {

            Image(systemName: "arrowtriangle.down.fill")
                .font(.title2)
                .foregroundStyle(.primary)

            Capsule()
                .fill(.primary)
                .frame(width: 2, height: 18)

        }
        .offset(y: -35)

    }

}

// MARK: - Ruler

extension WeightRuler {

    func ruler(width: CGFloat) -> some View {

        HStack(alignment: .bottom, spacing: tickSpacing) {

            ForEach(0..<tickCount, id: \.self) { index in

                let value = Int(minWeight) + index

                VStack(spacing: 8) {

                    Rectangle()
                        .fill(Color.gray.opacity(0.35))
                        .frame(
                            width: 2,
                            height: tickHeight(index)
                        )

                    if value % 10 == 0 {

                        Text("\(value)")
                            .font(.caption)
                            .foregroundStyle(.gray)

                    }

                }

            }

        }
        .padding(.horizontal, width / 2)
        .offset(x: dragOffset)

    }

}

// MARK: - Tick Height

extension WeightRuler {

    func tickHeight(_ index: Int) -> CGFloat {

        let value = Int(minWeight) + index

        if value % 10 == 0 {

            return 55

        }

        if value % 5 == 0 {

            return 38

        }

        return 22

    }

}
