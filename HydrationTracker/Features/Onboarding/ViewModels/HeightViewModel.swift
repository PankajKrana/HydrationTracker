//
//  HeightViewModel.swift
//  HydrationTracker
//

import SwiftUI

@Observable
final class HeightViewModel {

    enum Unit: String {
        case feet = "ft in"
        case cm = "cm"
    }

    var selectedUnit: Unit = .feet
    var selectedHeight: Int? = 57   // 4 ft 9 in

    private var totalInches: Int { selectedHeight ?? 57 }

    var ft: Int { totalInches / 12 }
    var inch: Int { totalInches % 12 }
    var cm: Int { Int((Double(totalInches) * 2.54).rounded()) }
}
