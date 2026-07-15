//
//  HeightScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//


import SwiftUI

struct HeightScreen: View {

    @State private var selectedUnit: Unit = .feet
    @State private var selectedHeight: Int? = 57      // 4 ft 9 in

    enum Unit: String {
        case feet = "ft in"
        case cm = "cm"
    }

    private var ft: Int {
        selectedHeight! / 12
    }

    private var inch: Int {
        selectedHeight! % 12
    }

    var body: some View {

        GeometryReader { geo in

            ZStack {

                appBg
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: Top Bar

                    HStack {

                        CustomBackButton {

                        }

                        Spacer()

                        Button("Skip") {

                        }
                        .font(.headline)
                        .foregroundStyle(.black)

                    }
                    .padding(.horizontal)
                    .padding(.top)

                    Spacer()

                    // MARK: Title

                    Text("What's\nYour Height?")
                        .font(.system(size: 38, weight: .bold))
                        .multilineTextAlignment(.center)

                    Spacer()

                    // MARK: Current Height

                    HStack(alignment: .firstTextBaseline, spacing: 3) {

                        Text("\(ft)")
                            .font(.system(size: 42, weight: .bold))

                        Text("ft")
                            .foregroundStyle(.secondary)

                        Text("\(inch)")
                            .font(.system(size: 42, weight: .bold))

                        Text("in")
                            .foregroundStyle(.secondary)

                    }

                    Spacer()

                    // MARK: Body + Scale

                    HStack(alignment: .center) {

                        Spacer()

                        Image("human")
                            .resizable()
                            .scaledToFit()
                            .frame(height: geo.size.height * 0.42)

                        HeightScale(selectedHeight: $selectedHeight)
                            .frame(width: geo.size.width * 0.22)

                        Spacer()

                    }

                    Spacer()

                    // MARK: Unit Picker

                    UnitPicker(selectedUnit: $selectedUnit)

                    Spacer()

                    // MARK: Continue

                    Button {

                    } label: {

                        Text("Continue")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color.blue.opacity(0.3))
                            .clipShape(Capsule())

                    }
                    .padding(.horizontal)

                    Spacer()
                        .frame(height: 20)

                }

            }

        }

    }

}

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

struct UnitPicker: View {

    @Binding var selectedUnit: HeightScreen.Unit

    var body: some View {

        HStack(spacing:0){

            Button {

                selectedUnit = .feet

            } label: {

                Text("ft in")
                    .foregroundStyle(
                        selectedUnit == .feet ? .black : .gray
                    )
                    .frame(maxWidth:.infinity)
                    .padding(.vertical,12)

            }

            Button {

                selectedUnit = .cm

            } label: {

                Text("cm")
                    .foregroundStyle(
                        selectedUnit == .cm ? .black : .gray
                    )
                    .frame(maxWidth:.infinity)
                    .padding(.vertical,12)

            }

        }
        .background(.white.opacity(0.9))
        .clipShape(Capsule())
        .overlay {

            Capsule()
                .stroke(.gray.opacity(0.15))

        }
        .frame(width:140)

    }

}

#Preview {
    HeightScreen()
}
