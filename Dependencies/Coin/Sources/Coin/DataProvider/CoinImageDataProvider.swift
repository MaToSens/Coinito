//
//  CoinImageDataProvider.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinBackendInterface
import CoinInterface
import Combine
import DatabaseInterface
import DependencyInjection
import SwiftUI

final class CoinImageDataProvider: CoinImageDataProviderInterface {
    @Inject private var client: ClientInterface
    @Inject private var fileStorageManager: FileStorageManagerInterface
    private let folderName = "coin_images"
    private let fileExtension = ".png"
    
    func fetchCoinImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError> {
        fetchLocalImage(for: coin)
            .catch { [unowned self] _ in self.fetchRemoteImage(for: coin) }
            .eraseToAnyPublisher()
    }
    
    private func fetchLocalImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError> {
        fileStorageManager
            .retrieve(
                folderName,
                fileName: coin.symbol,
                withExtension: fileExtension
            )
            .mapError { error in
                switch error {
                case .unableToAccessURL: return CoinError.invalidURL
                case .unableToFind: return CoinError.unableToFindImage
                default: return .unknown
                }
            }
            .tryMap(dataToImage)
            .mapError { $0 as? CoinError ?? .invalidData }
            .eraseToAnyPublisher()
    }
    
    private func fetchRemoteImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError> {
        client
            .fetch(coin.image)
            .mapError { CoinError.networkError($0) }
            .tryMap { [unowned self] data in
                try self.saveDataAndConvertToImage(data, coin: coin)
            }
            .mapError { $0 as? CoinError ?? .invalidData }
            .eraseToAnyPublisher()
    }
    
    private func saveDataAndConvertToImage(_ data: Data, coin: Coin) throws -> UIImage {
        do {
            try fileStorageManager.save(
                data,
                folderName: folderName,
                fileName: coin.symbol,
                withExtension: fileExtension
            )
        } catch {
            throw CoinError.unableToSaveImage
        }
        
        return try dataToImage(data: data)
    }

    private func dataToImage(data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw CoinError.invalidData
        }
        
        return image
    }
}
