//
//  Client.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinBackendInterface
import Combine
import Foundation
import Utilities

final class Client: ClientInterface {
    func fetch(_ urlString: String) -> AnyPublisher<Data, HTTPError> {
        URLSession
            .downloadPublisher(for: urlString)
            .eraseToAnyPublisher()
    }
    
    func fetchDecodedObject<Response: Decodable>(_ urlString: String) -> AnyPublisher<Response, HTTPError> {
        URLSession
             .downloadPublisher(for: urlString)
             .decode(
                 type: Response.self,
                 decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
             )
             .mapError { $0 as? HTTPError ?? .invalidDecoding($0) }
             .eraseToAnyPublisher()
    }
    
    func fetchDecodedObjects<Response: Decodable>(_ urlString: String) -> AnyPublisher<[Response], HTTPError> {
       URLSession
            .downloadPublisher(for: urlString)
            .decode(
                type: [Response].self,
                decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
            )
            .mapError { $0 as? HTTPError ?? .invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}

// MARK: Endpoint
extension Client {
    func fetch<Endpoint: EndpointInterface>(endpoint: Endpoint) -> AnyPublisher<Data, HTTPError> {
        URLSession
            .downloadPublisher(endpoint: endpoint)
            .eraseToAnyPublisher()
    }
    
    func fetchDecodedObject<Endpoint: EndpointInterface, Response: Decodable>(endpoint: Endpoint) -> AnyPublisher<Response, HTTPError> {
        URLSession
            .downloadPublisher(endpoint: endpoint)
            .decode(
                type: Response.self,
                decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
            )
            .mapError { $0 as? HTTPError ?? .invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
    
    func fetchDecodedObjects<Endpoint: EndpointInterface, Response: Decodable>(endpoint: Endpoint) -> AnyPublisher<[Response], HTTPError> {
        URLSession
            .downloadPublisher(endpoint: endpoint)
            .decode(
                type: [Response].self,
                decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
            )
            .mapError { $0 as? HTTPError ?? .invalidDecoding($0) }
            .eraseToAnyPublisher()
    }
}
