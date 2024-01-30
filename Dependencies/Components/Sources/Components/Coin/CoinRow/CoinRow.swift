//
//  CoinRow.swift
//  
//
//  Created by MaTooSens on 27/01/2024.
//

import CoinInterface
import Design
import SwiftUI
import Utilities

public struct CoinRow: View {
    private let coin: Coin
    
    public init(coin: Coin) {
        self.coin = coin
    }
    
    public var body: some View {
        HStack {
            buildCoinInfoColumn()
        
            buildPriceColumn()
            
            buildMarketCapColumn()
        }
    }
    
    private func buildCoinInfoColumn() -> some View {
        HStack {
            Text("\(coin.rank)")
                .appFont(relativeTo: .footnote)
                .foregroundColor(Color.theme.secondary)
                .frame(minWidth: 15)
            
            CoinImageView(coin: coin)
                .frame(width: 25, height: 25)
            
            CoinNameSymbolView(coin: coin, variant: .small)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func buildPriceColumn() -> some View {
        VStack(alignment: .trailing, spacing: 0){
            CurrencyAmountView(
                amount: coin.currentPrice,
                digits: 2,
                textStyle: .caption
            )
            
            CurrencyAmountView(
                amount: coin.priceChange24H,
                digits: 2,
                textStyle: .caption2
            )
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private func buildMarketCapColumn() -> some View {
        VStack(alignment: .trailing, spacing: 0) {
            CurrencyAmountView(
                amount: coin.marketCap,
                digits: 0,
                textStyle: .caption
            )
            
            CoinTrendIndicatorView(
                coin.marketCapChangePercentage24H,
                textStyle: .caption2
            )
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
