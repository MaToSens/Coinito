//
//  CoinBackend.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinBackendInterface
import DependencyInjection
import Foundation

public struct Dependencies {
    public static func inject() {
        Assemblies.inject(type: ClientInterface.self, object: Client())
    }
}
