//
//  CoinManager.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Combine
import CoinInterface
import Foundation
import SwiftUI

final class CoinManager: CoinManagerInterface {
    private let coinsDataProvider = CoinsDataProvider()
    private let coinImageDataProvider = CoinImageDataProvider()
    private let coinChartDataProvider = CoinChartDataProvider()
    
    func fetchCoins(
        vsCurrency: String,
        page: Int
    ) -> AnyPublisher<[Coin], CoinError> {
        coinsDataProvider
            .fetchCoins(vsCurrency: vsCurrency, page: page)
    }
    
    func fetchCoinImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError> {
        coinImageDataProvider
            .fetchCoinImage(for: coin)
    }
    
    func fetchCoinChart(
        coinID: String,
        vsCurrency: String = "usd",
        days: String = "1"
    ) -> AnyPublisher<CoinChart, CoinError> {
        coinChartDataProvider
            .fetchCoinChartDetails(coinID: coinID, vsCurrency: vsCurrency, days: days)
    }
}
