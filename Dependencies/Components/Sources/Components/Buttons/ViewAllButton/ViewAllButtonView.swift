//
//  ViewAllButtonView.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Design
import SwiftUI

public struct ViewAllButtonView: View {
    public init() { }
    
    public var body: some View {
        Text("View All")
            .appFont(.semibold, relativeTo: .body)
            .foregroundStyle(Color.theme.accent)
    }
}
