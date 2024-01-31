//
//  CoinMocks.swift
//  
//
//  Created by MaTooSens on 16/01/2024.
//
import CoinBackend
import CoinInterface
import Database
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
        Assemblies.inject(type: CoinManagerInterface.self, object: CoinManager())
        
        Database.Dependencies.inject()
        CoinBackend.Dependencies.inject()
    }
}
