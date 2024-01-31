//
//  Coin.swift
//
//
//  Created by MaTooSens on 16/01/2024.
//

import CoinInterface
import CoinBackend
import DependencyInjection
import Database
import Foundation

public struct Dependencies {
    public static func inject() {
        Assemblies.inject(type: CoinManagerInterface.self, object: CoinManager())
        
        CoinBackend.Dependencies.inject()
        Database.Dependencies.inject()
    }
}
