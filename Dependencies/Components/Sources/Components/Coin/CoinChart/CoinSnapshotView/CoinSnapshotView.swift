//
//  SwiftUIView.swift
//  
//
//  Created by MaTooSens on 29/01/2024.
//

import CoinInterface
import Charts
import Design
import SwiftUI

public struct CoinSnapshotView: View {
    @StateObject private var viewModel: CoinSnapshotViewModel
    private let coin: Coin
    
    public init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: CoinSnapshotViewModel(coin: coin))
        self.coin = coin
    }
    
    public var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .loaded(let coinChart):
            buildOverviewChartView(coinChart)
        case .error(let error):
            Label("Error: \(error.localizedDescription)", systemImage: "exclamationmark.octagon.fill")
                .foregroundStyle(Color.theme.secondary)
        }
    }
    
    private func buildOverviewChartView(_ coinChart: CoinChart) -> some View {
        VStack {
            buildCoinInfo()
            
            SimpleChartView(
                chartData: coinChart.prices,
                priceChangePercentage24H: coin.priceChangePercentage24H
            )
            
            buildCoinPrice()
        }
        .padding()
        .frame(maxHeight: 180)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.theme.componentBackground)
        )
    }
   
    private func buildCoinInfo() -> some View {
        HStack {
            CoinImageView(coin: coin)
                .frame(width: 35, height: 35)
            
            CoinNameSymbolView(coin: coin, variant: .large)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func buildCoinPrice() -> some View {
        HStack {
            CurrencyAmountView(amount: coin.currentPrice, textStyle: .caption)
            
            CoinTrendIndicatorView(coin.priceChangePercentage24H, textStyle: .caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
