//
//  CoinNameSymbolView.swift
//
//
//  Created by MaTooSens on 30/01/2024.
//

import CoinInterface
import Design
import SwiftUI

public struct CoinNameSymbolView: View {
    public enum Variant {
        case small
        case large
    }
    
    private let coin: Coin
    private let variant: Variant
    private let color = Color.theme
    
    public init(
        coin: Coin,
        variant: Variant
    ) {
        self.coin = coin
        self.variant = variant
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(coin.symbol.uppercased())
                .appFont(.semibold, relativeTo: variant == .small ? .footnote : .callout)
                .foregroundStyle(color.primary)
            
            Text(coin.name.capitalized)
                .appFont(relativeTo: variant == .small ? .caption : .footnote )
                .foregroundStyle(color.secondary)
                .lineLimit(1)
        }
    }
}
