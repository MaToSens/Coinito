//
//  OverviewChartViewModel.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Combine
import CoinInterface
import DependencyInjection
import Foundation

final class CoinSnapshotViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(CoinChart)
        case error(Error)
    }
    
    @Inject private var coinManager: CoinManagerInterface
    
    @Published private(set) var state: State = .loading
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinChartData()
    }
    
    private func getCoinChartData() {
        coinManager
            .fetchCoinChart(coinID: coin.name, vsCurrency: "usd", days: "1")
            .receive(on: RunLoop.main)
            .map(filterEveryTenthPrice)
            .map { State.loaded($0) }
            .catch { Just(.error($0)) }
            .assign(to: &$state)
    }
    
    private func filterEveryTenthPrice(_ coinChart: CoinChart) -> CoinChart {
        let filteredPrices = coinChart.prices
             .enumerated()
             .filter { $0.offset % 10 == 0 }
             .map { $1 }
         
         return CoinChart(prices: filteredPrices, marketCaps: coinChart.marketCaps, totalVolumes: coinChart.totalVolumes)
    }
}
