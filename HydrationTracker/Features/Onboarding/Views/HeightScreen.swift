//
//  HeightScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 15/07/26.
//

import SwiftUI

struct HeightScreen: View {
    @Environment(AppRouter.self) private var router
    @State private var vm = HeightViewModel()

    var body: some View {
        @Bindable var vm = vm
        GeometryReader { geo in
            ZStack {
                appBg
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // MARK: Top Bar
                    HStack {
                        CustomBackButton {
                            router.pop()
                        }

                        Spacer()

                        Button("Skip") {
                            router.push(.bedTime)
                        }
                        .font(.headline)
                        .foregroundStyle(.primary)
                    }
                    .padding(.horizontal)
                    .padding(.top)

                    Spacer()

                    // MARK: Title
                    Text("What's\nYour Height?")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)

                    Spacer()

                    // MARK: Current Height
                    HStack(alignment: .firstTextBaseline, spacing: 3) {
                        Text("\(vm.ft)")
                            .font(.largeTitle)
                            .bold()

                        Text("ft")
                            .foregroundStyle(.secondary)

                        Text("\(vm.inch)")
                            .font(.largeTitle)
                            .bold()

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

                        HeightScale(selectedHeight: $vm.selectedHeight)
                            .frame(width: geo.size.width * 0.22)

                        Spacer()
                    }

                    Spacer()

                    // MARK: Unit Picker
                    UnitPicker(selectedUnit: $vm.selectedUnit)

                    Spacer()

                    // MARK: Continue
                    Button {
                        router.push(.bedTime)
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

#Preview {
    HeightScreen()
        .environment(AppRouter())
}
