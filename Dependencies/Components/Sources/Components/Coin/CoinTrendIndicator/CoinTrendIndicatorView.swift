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
    private let trendPercentage: Double?
    private let textStyle: Font.TextStyle
    
    public init(
        _ trendPercentage: Double?,
        textStyle: Font.TextStyle = .footnote
    ) {
        self.trendPercentage = trendPercentage
        self.textStyle = textStyle
    }
    
    public var body: some View {
        if let trendPercentage {
            buildTrendView(trendPercentage)
        } else {
            buildNoDataView()
        }
    }
    
    @ViewBuilder
    private func buildTrendView(_ trendPercentage: Double) -> some View {
        let isTrendUp = trendPercentage >= 0
        
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Image(isTrendUp ? "trend-up" : "trend-down")
                .renderingMode(.template)
            
            Text(abs(trendPercentage).asPercentString())
                .appFont(.bold, relativeTo: textStyle)
        }
        .foregroundStyle(isTrendUp ? Color.green : Color.red)
    }
    
    private func buildNoDataView() -> some View {
        Text("-")
            .appFont(.bold, relativeTo: textStyle)
            .foregroundStyle(.secondary)
    }
}
