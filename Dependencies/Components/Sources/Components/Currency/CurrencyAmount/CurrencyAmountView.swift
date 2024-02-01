//
//  CurrencyAmountView.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//


import Design
import SwiftUI

public struct CurrencyAmountView: View {
    private let amount: Double?
    private let digits: Int
    private let textStyle: Font.TextStyle
    
    public init(
        amount: Double?,
        digits: Int = 2,
        textStyle: Font.TextStyle = .body
    ) {
        self.amount = amount
        self.digits = digits
        self.textStyle = textStyle
    }
    
    public var body: some View {
        if let amount {
            Text(amount.asCurrencyWithDecimals(digits))
                .appFont(.semibold, relativeTo: textStyle)
        } else {
            Text("-")
                .appFont(.bold, relativeTo: textStyle)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CurrencyAmountView(amount: 123456)
}
