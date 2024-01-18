//
//  AppIdentityView.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import SwiftUI

public struct AppIdentityView: View {
    public enum ViewType {
        case logo
        case logoWithName
    }
    
    private var viewType: ViewType
    
    public init(_ viewType: ViewType = .logo) {
        self.viewType = viewType
    }
    
    public var body: some View {
        HStack {
            Image("appLogo", bundle: .module)
            
            if case .logoWithName = viewType {
                Text("Coinito")
                    .appFont(.bold, relativeTo: .headline)
            }
        }
    }
}
