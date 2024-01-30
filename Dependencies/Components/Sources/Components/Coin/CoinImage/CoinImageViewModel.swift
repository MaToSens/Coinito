//
//  CoinImageViewModel.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinInterface
import Combine
import DependencyInjection
import SwiftUI

final class CoinImageViewModel: ObservableObject {
    enum State {
        case loading
        case loaded(UIImage)
        case error(Error)
    }
    
    @Inject private var coinManager: CoinManagerInterface
    
    @Published private(set) var state: State = .loading
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getImage()
    }
    
    private func getImage() {
        coinManager
            .fetchCoinImage(for: coin)
            .receive(on: RunLoop.main)
            .map { State.loaded($0) }
            .catch { Just(.error($0)) }
            .assign(to: &$state)
    }
}
