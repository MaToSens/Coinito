//
//  CoinTrendIndicatorView.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import Design
import SwiftUI
import Utilities

public struct CoinTrendIndicatorView: View {
    private let trendPercentage: Double
    
    public init(_ trendPercentage: Double) {
        self.trendPercentage = trendPercentage
    }
    
    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 5) {
            Image(trendPercentage >= 0 ? "trend-up" : "trend-down", bundle: .module)
                .renderingMode(.template)
            
            Text("\(trendPercentage.asPercentString())")
                .appFont(.bold, relativeTo: .footnote)
        }
        .foregroundStyle(trendPercentage >= 0 ? .green : .red)
    }
}
