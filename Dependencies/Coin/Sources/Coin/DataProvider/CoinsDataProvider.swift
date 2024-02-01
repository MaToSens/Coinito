//
//  CoinsDataProvider.swift
//
//
//  Created by MaTooSens on 27/01/2024.
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
        vsCurrency: String,
        order: String = "market_cap_desc",
        perPage: Int = 10,
        page: Int = 1,
        sparkline: Bool = false,
        locale: String = "en"
    ) {
        self.components = ["markets"]
        self.parameters = [
            "vs_currency": vsCurrency,
            "order": order,
            "per_page": perPage,
            "page": page,
            "sparkline": sparkline,
            "locale": locale
        ]
    }
}

final class CoinsDataProvider {
    @Inject private var client: ClientInterface
    
    func fetchCoins(vsCurrency: String, page: Int) -> AnyPublisher<[Coin], CoinError> {
        let endpoint: Endpoint = Endpoint(vsCurrency: vsCurrency, page: page)
        
        return client
            .fetchDecodedObjects(endpoint: endpoint)
            .mapError{ error in
                switch error {
                case .invalidURL: return CoinError.invalidURL
                case .networkError(let error): return .networkError(error)
                case .invalidResponse: return .invalidResponse
                case .invalidStatusCode(let statusCode): return .invalidStatusCode(statusCode)
                case .invalidDecoding(let error): return .invalidDecoding(error)
                default: return .unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
