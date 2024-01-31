//
//  CoinImageDataProvider.swift
//
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import CoinInterface
import DatabaseInterface
import DependencyInjection
import SwiftUI

final class CoinImageDataProvider: CoinImageDataProviderInterface {
    @Inject private var fileStorageManager: FileStorageManagerInterface
    private let folderName = "coin_images"
    
    func fetchCoinImage(for coin: Coin) -> AnyPublisher<UIImage, CoinError> {
        fileStorageManager
            .retrieve(
                folderName,
                fileName: coin.symbol,
                withExtension: ".png"
            )
            .tryMap(mapDataToImage)
            .mapError { _ in CoinError.invalidData }
            .eraseToAnyPublisher()
    }
    
    private func mapDataToImage(data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw CoinError.invalidData
        }
        
        return image
    }
}
