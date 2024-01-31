//
//  CoinChartDataProvider.swift
//
//
//  Created by MaTooSens on 30/01/2024.
//

import CoinBackendInterface
import CoinInterface
import Combine
import DependencyInjection
import Foundation

fileprivate struct Endpoint: EndpointInterface {
    let components: [String]
    let parameters: [String : Any]
    static let base: String = "/coins"
    
    init(
        coinID: String,
        vsCurrency: String,
        days: String
    ) {
        self.components = [
            coinID.lowercased(),
            "market_chart"
        ]
        self.parameters = [
            "vs_currency": vsCurrency,
            "days": days
        ]
    }
}

final class CoinChartDataProvider: CoinChartDataProviderInterface {
    @Inject private var client: ClientInterface
    
    func fetchCoinChartDetails(
        coinID: String,
        vsCurrency: String,
        days: String
    ) -> AnyPublisher<CoinChart, CoinError> {
        let endpoint: Endpoint = Endpoint(coinID: coinID, vsCurrency: vsCurrency, days: days)
        
        return client
            .fetchDecodedObject(endpoint: endpoint)
            .mapError{ error in
                switch error {
                case .invalidURL: return CoinError.invalidURL
                case .networkError(let error): return .networkError(error)
                case .invalidResponse: return .invalidResponse
                case .invalidStatusCode(let int): return .invalidStatusCode(int)
                case .invalidDecoding(let error): return .invalidDecoding(error)
                default: return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
