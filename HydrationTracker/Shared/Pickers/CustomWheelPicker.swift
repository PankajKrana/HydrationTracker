//
//  CustomWheelPicker.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//


import SwiftUI

struct CustomWheelPicker: View {

    let values: [Int]
    @Binding var selection: Int

    var rowHeight: CGFloat = 50
    var visibleRows: Int = 5

    var body: some View {

        GeometryReader { geometry in

            ScrollViewReader { proxy in

                ScrollView(.vertical) {

                    LazyVStack(spacing: 0) {

                        ForEach(values, id: \.self) { value in

                            WheelRow(
                                value: value,
                                selected: value == selection,
                                rowHeight: rowHeight
                            )
                            .id(value)
                            .onTapGesture {

                                withAnimation(.snappy) {
                                    selection = value
                                    proxy.scrollTo(value, anchor: .center)
                                }

                            }

                        }

                    }
                    .padding(.vertical,
                             geometry.size.height / 2 - rowHeight / 2)

                }
                .scrollIndicators(.hidden)
                .onAppear {

                    proxy.scrollTo(selection, anchor: .center)

                }

            }

        }
        .frame(height: rowHeight * CGFloat(visibleRows))
        .clipped()

    }

}

private struct WheelRow: View {

    let value: Int
    let selected: Bool
    let rowHeight: CGFloat

    var body: some View {

        Text(String(format: "%02d", value))
            .font(selected ?
                  .system(size: 34, weight: .bold) :
                  .system(size: 26))
            .foregroundStyle(selected ? .primary : .secondary)
            .opacity(selected ? 1 : 0.35)
            .frame(height: rowHeight)

    }

}
