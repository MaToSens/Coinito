//
//  BlueButtonView.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Design
import SwiftUI

public struct BlueButtonView: View {
    private let color = Color.theme
    private let imageName: String
    private let title: String
    private var action: () -> Void
    
    public init(
        _ imageName: String,
        title: String = "",
        action: @escaping () -> Void
    ) {
        self.imageName = imageName
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            TemplateRenderedImageView(imageName)
            
            if !title.isEmpty {
                Text(title)
                    .appFont(.semibold, relativeTo: .body)
            }
        }
        .foregroundStyle(.white)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.accent)
        )
    }
}
