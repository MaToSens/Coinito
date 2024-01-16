//
//  HomeMocks.swift
//  
//
//  Created by MaTooSens on 16/01/2024.
//

import CoinMocks
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
        CoinMocks.Dependencies.inject()
    }
}
