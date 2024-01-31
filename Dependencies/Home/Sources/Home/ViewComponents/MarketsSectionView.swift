//
//  MarketsSection.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Components
import CoinInterface
import SwiftUI

struct MarketsSectionView: View {
    let coins: [Coin]
    private let color = Color.theme
    
    var body: some View {
        VStack {
            buildHeader()
            
            MarketsTableHeaderView(variant: .price)
            
            MarketsScrollView()
        }
        .padding(.horizontal)
    }
    
    private func buildHeader() -> some View {
        HStack {
            SectionTitleView("Markets")
            
            Spacer()
            
            ViewAllButtonView()
        }
        .padding(.bottom)
    }
    
    private func MarketsScrollView() -> some View {
        ScrollView(showsIndicators: false) {
            ForEach(coins) { coin in
                CoinRow(coin: coin)
            }
        }
    }
}
