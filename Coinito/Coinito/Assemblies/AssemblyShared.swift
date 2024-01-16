//
//  AssemblyShared.swift
//  Coinito
//
//  Created by MaTooSens on 16/01/2024.
//

import Design
import DependencyInjection
import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        Assemblies.setupDependencies()
        AssemblyShared.setupDependnecies()
    }
}

final class AssemblyShared {
    static func setupDependnecies() {
        Design.AppFont.registerFonts()
    }
}
