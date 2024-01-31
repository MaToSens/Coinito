//
//  CoinInterface.swift
//  
//
//  Created by MaTooSens on 16/01/2024.
//

import Combine
import Foundation
import SwiftUI

public protocol CoinManagerInterface {
    func fetchCoins(
        vsCurrency: String,
        page: Int
    ) -> AnyPublisher<[Coin], CoinError>
    
    func fetchCoinImage(
        for coin: Coin
    ) -> AnyPublisher<UIImage, CoinError>
    
    func fetchCoinChart(
        coinID: String,
        vsCurrency: String,
        days: String
    ) -> AnyPublisher<CoinChart, CoinError>
}

// MARK: Data Providers -
public protocol CoinImageDataProviderInterface {
    func fetchCoinImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError>
}

public protocol CoinChartDataProviderInterface {
    func fetchCoinChartDetails(
        coinID: String,
        vsCurrency: String,
        days: String
    ) -> AnyPublisher<CoinChart, CoinError>
}

// MARK: Errors -
public enum CoinError: LocalizedError {
    // API
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidStatusCode(Int)
    case invalidDecoding(Error)
    case invalidData
    
    // Database
    case unableToConvertToData(Error)
    case unableToCreateDirectory
    case unableToFindImage
    case unableToSaveImage
    
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .networkError(let error): return "Network Error: \(error.localizedDescription)"
        case .invalidResponse: return "Invalid Response"
        case .invalidStatusCode(let statusCode): return "Invalid Status Code: \(statusCode)"
        case .invalidDecoding(let decodingError): return "Invalid Decoding: \(decodingError.localizedDescription)"
        case .invalidData: return "Invalid Data"
        case .unableToConvertToData(let error): return "Unable to Convert to Data: \(error.localizedDescription)"
        case .unableToCreateDirectory: return "Unable to Create Directory"
        case .unableToFindImage: return "Unable to Find Coin Image"
        case .unableToSaveImage: return "Unable to Save Coin Image"
        case .unknown: return "Unknown Error"
        }
    }
}
