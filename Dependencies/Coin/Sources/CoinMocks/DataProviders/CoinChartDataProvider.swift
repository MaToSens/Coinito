//
//  CoinChartDataProvider.swift
//
//
//  Created by MaTooSens on 28/01/2024.
//

import Combine
import CoinInterface
import Foundation
import Utilities

final class CoinChartDataProvider: CoinChartDataProviderInterface  {
    func fetchCoinChartDetails(
        coinID: String,
        vsCurrency: String,
        days: String
    ) -> AnyPublisher<CoinChart, CoinError>{
        Bundle
            .module
            .decodable(fileName: "CoinChart", withExtension: ".json")
            .mapError{ CoinError.invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}
