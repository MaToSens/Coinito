//
//  RoundedBackgroundImage.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Design
import SwiftUI

public struct RoundedBackgroundImage: View {
    private let name: String
    private let color = Color.theme
    
    public init(_ name: String) {
        self.name = name
    }
    
    public var body: some View {
        Image(name, bundle: .module)
            .renderingMode(.template)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundStyle(color.secondary)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.componentBackground)
            )
    }
}
