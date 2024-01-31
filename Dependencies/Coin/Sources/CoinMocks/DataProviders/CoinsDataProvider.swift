//
//  CoinsMarketsDataProvider.swift
//
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import CoinInterface
import Foundation
import Utilities

final class CoinsDataProvider {
    func fetchCoins() -> AnyPublisher<[Coin], CoinError> {
        Bundle
            .module
            .decodable(fileName: "Coins", withExtension: ".json")
            .mapError{ CoinError.invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}
