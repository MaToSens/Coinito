//
//  HomeViewModel.swift
//
//
//  Created by MaTooSens on 17/01/2024.
//

import Combine
import CoinInterface
import DependencyInjection
import Foundation

final class HomeViewModel: ObservableObject {
    enum State {
        case loading
        case loaded([Coin])
        case error(Error)
    }
    
    @Inject private var coinManager: CoinManagerInterface
    @Published private(set) var state: State = .loading
    
    init() { fetchCoins() }
    
    func fetchCoins() {
        coinManager
            .fetchCoins(vsCurrency: "usd", page: 1)
            .receive(on: RunLoop.main)
            .map { State.loaded($0) }
            .catch { Just(.error($0)) }
            .assign(to: &$state)
    }
}
