//
//  Assembly.swift
//  Coinito
//
//  Created by MaTooSens on 16/01/2024.
//

import DependencyInjection
import Home

extension Assemblies {
    static func setupDependencies() {
        Home.Dependencies.inject()
    }
}

