//
//  TemplateRenderedImageView.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import SwiftUI

public struct TemplateRenderedImageView: View {
    private let imageName: String
    
    public init(_ imageName: String) {
        self.imageName = imageName
    }
    
    public var body: some View {
        Image(imageName, bundle: .module)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
}
