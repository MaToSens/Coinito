//
//  CurrencyAmountView.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import SwiftUI

public struct CurrencyAmountView: View {
    private var amount: Double
    
    public init(_ amount: Double) {
        self.amount = amount
    }
    
    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text("$")
                .appFont(.semibold)
                .foregroundStyle(Color.theme.secondary)
            
            Text(amount.asCurrencyWithDecimals(2))
                .appFont(.semibold, relativeTo: .largeTitle)
        }
    }
}
