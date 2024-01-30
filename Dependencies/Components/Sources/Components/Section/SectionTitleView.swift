//
//  SectionTitleView.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Design 
import SwiftUI

public struct SectionTitleView: View {
    private let title: String
    
    public init(_ title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
            .appFont(.semibold, relativeTo: .subheadline)
            .foregroundStyle(Color.theme.secondary)
    }
}
