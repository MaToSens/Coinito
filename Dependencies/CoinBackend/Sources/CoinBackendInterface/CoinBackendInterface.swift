//
//  CoinBackendInterface.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import Combine
import Foundation

public protocol ClientInterface {
    func fetch(_ urlString: String) -> AnyPublisher<Data, HTTPError>
    func fetchDecodedObject<Response: Decodable>(_ urlString: String) -> AnyPublisher<Response, HTTPError>
    func fetchDecodedObjects<Response: Decodable>(_ urlString: String) -> AnyPublisher<[Response], HTTPError>
    
    // Endpoint
    func fetch<Endpoint: EndpointInterface>(endpoint: Endpoint) -> AnyPublisher<Data, HTTPError>
    func fetchDecodedObject<Endpoint: EndpointInterface, Response: Decodable>(endpoint: Endpoint) -> AnyPublisher<Response, HTTPError>
    func fetchDecodedObjects<Endpoint: EndpointInterface, Response: Decodable>(endpoint: Endpoint) -> AnyPublisher<[Response], HTTPError>
}

public protocol EndpointInterface {
    var components: [String] { get }
    var parameters: [String: Any] { get }
    static var base: String { get }
}

public enum HTTPError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidDecoding(Error)
    case invalidParameters
}
