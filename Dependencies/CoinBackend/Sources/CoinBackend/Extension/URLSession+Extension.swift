//
//  URLSession+Extension.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinBackendInterface
import Combine
import Foundation

extension URLSession {
    static func downloadPublisher(for urlString: String) -> AnyPublisher<Data, HTTPError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: .invalidURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .mapError { HTTPError.networkError($0) }
            .tryMap(validateResponse)
            .mapError { $0 as? HTTPError ?? .invalidResponse }
            .eraseToAnyPublisher()
    }
    
    static func downloadPublisher<Endpoint: EndpointInterface>(endpoint: Endpoint) -> AnyPublisher<Data, HTTPError> {
        do {
            let url = try buildURL(endpoint: endpoint)
            
            return URLSession
                .shared
                .dataTaskPublisher(for: url)
                .mapError { HTTPError.networkError($0) }
                .tryMap(validateResponse)
                .mapError { $0 as? HTTPError ?? .invalidResponse }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error as? HTTPError ?? .invalidParameters)
                .eraseToAnyPublisher()
        }
    }
    
    // MARK: Helper functions
    private static func buildURL<Endpoint: EndpointInterface>(endpoint: Endpoint) throws -> URL {
        let baseURLString: String = "https://api.coingecko.com/api/v3"
        let path = buildPath(from: endpoint)
        
        guard let url = URL(
            string: baseURLString.appending(path),
            with: endpoint.parameters
        ) else {
            throw HTTPError.invalidParameters
        }
        
        return url
    }
    
    private static func buildPath<Endpoint: EndpointInterface>(from endpoint: Endpoint) -> String {
        var components = endpoint.components
        components.insert(Endpoint.base, at: 0)
        
        return components.joined(separator: "/")
    }
    
    private static func validateResponse(
        data: Data,
        response: URLResponse
    ) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw HTTPError.invalidStatusCode(httpResponse.statusCode)
        }
        
        return data
    }
}
