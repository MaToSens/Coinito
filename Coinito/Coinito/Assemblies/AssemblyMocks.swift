//
//  AssemblyMocks.swift
//  Coinito
//
//  Created by MaTooSens on 16/01/2024.
//

import HomeMocks
import DependencyInjection

extension Assemblies {
    static func setupDependencies() {
        HomeMocks.Dependencies.inject()
    }
}
