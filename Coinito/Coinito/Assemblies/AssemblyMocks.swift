//
//  AssemblyMocks.swift
//  Coinito
//
//  Created by MaTooSens on 16/01/2024.
//

import DependencyInjection
import HomeMocks

extension Assemblies {
    static func setupDependencies() {
        HomeMocks.Dependencies.inject()
    }
}
