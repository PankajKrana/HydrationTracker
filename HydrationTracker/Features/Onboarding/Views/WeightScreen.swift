//
//  WeightScreen.swift
//  HydrationTracker
//
//  Created by Pankaj Kumar Rana on 16/07/26.
//

import SwiftUI

struct WeightScreen: View {
    @Environment(AppRouter.self) private var router

    @State private var weight: Double = 60

    var body: some View {

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
                        router.push(.height)
                    }
                    .font(.headline)
                    .foregroundStyle(.black)

                }
                .padding(.horizontal)
                .padding(.top)

                Spacer()

                // MARK: Title

                Text("What's your\nbody Weight?")
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)

                Spacer()

                // MARK: Weight Display

                HStack(alignment: .firstTextBaseline, spacing: 4) {

                    Text("\(Int(weight))")
                        .font(.system(size: 48, weight: .bold))

                    Text("kg")
                        .font(.title3)
                        .foregroundStyle(.secondary)

                }

                Spacer()

                // MARK: Custom Ruler

                WeightRuler(weight: $weight)
                    .frame(height: 120)

                Spacer()

                ReusableButton(title: "Continue") {
                    router.push(.height)
                }
                .padding(.horizontal)

                Spacer()
                    .frame(height: 25)

            }
            

        }

    }

}

#Preview {
    WeightScreen()
        .environment(AppRouter())
}
