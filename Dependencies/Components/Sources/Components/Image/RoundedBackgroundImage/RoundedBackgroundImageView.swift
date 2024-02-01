//
//  RoundedBackgroundImageView.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Design
import SwiftUI

public struct RoundedBackgroundImageView: View {
    private let imageName: String
    private let color = Color.theme
    
    public init(_ imageName: String) {
        self.imageName = imageName
    }
    
    public var body: some View {
        TemplateRenderedImageView(imageName)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.componentBackground)
            )
    }
}
