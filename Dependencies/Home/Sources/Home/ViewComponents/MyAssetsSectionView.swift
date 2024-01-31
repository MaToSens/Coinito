//
//  MyAssetsSection.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Components
import CoinInterface
import SwiftUI

struct MyAssetsSectionView: View {
    private let coins: [Coin]
    
    init(_ coins: [Coin]) {
        self.coins = coins
    }
    
    var body: some View {
        VStack {
            buildHeader()
            
            buildOverviewChartView()
        }
        .padding(.horizontal)
    }
    
    private func buildHeader() -> some View {
        HStack {
            SectionTitleView("My Assets")
            
            Spacer()
            
            ViewAllButtonView()
        }
        .padding(.bottom)
    }
    
    private func buildOverviewChartView() -> some View {
        HStack(spacing: 20) {
            CoinSnapshotView(coin: coins[0])
            
            CoinSnapshotView(coin: coins[1])
        }
    }
}
