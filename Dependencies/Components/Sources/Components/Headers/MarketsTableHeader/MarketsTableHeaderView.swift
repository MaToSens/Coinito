//
//  MarketsTableHeaderView.swift
//
//
//  Created by MaTooSens on 30/01/2024.
//

import Design
import SwiftUI

public struct MarketsTableHeaderView: View {
    public enum Variant: String {
        case price
        case amount
    }
    
    private let variant: Variant
    private let color = Color.theme
    
    public init(variant: Variant) {
        self.variant = variant
    }
    
    public var body: some View {
        HStack {
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(variant.rawValue.capitalized)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("24h Change")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .appFont(.medium, relativeTo: .footnote)
        .foregroundStyle(color.secondary)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(color.componentBackground)
        )
    }
}
