//
//  Assembly.swift
//  Coinito
//
//  Created by MaTooSens on 16/01/2024.
//

import Home
import DependencyInjection

extension Assemblies {
    static func setupDependencies() {
        Home.Dependencies.inject()
    }
}
