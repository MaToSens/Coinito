//
//  AppIdentity.swift
//
//
//  Created by MaTooSens on 18/01/2024.
//

import SwiftUI

public struct AppIdentity: View {
    public enum IdentityViewType {
        case logo
        case logoWithName
    }
    
    private var viewType: IdentityViewType
    
    public init(_ viewType: IdentityViewType = .logo) {
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
