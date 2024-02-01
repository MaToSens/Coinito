//
//  HomeView.swift
//
//
//  Created by MaTooSens on 17/01/2024.
//

import CoinInterface
import Components
import Design
import SwiftUI
import Utilities

public struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    public init() { }
    
    public var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .loaded(let coins):
            buildHomeView(coins)
        case .error(let error):
            Label("Error: \(error.localizedDescription)", systemImage: "questionmark")
                .foregroundStyle(Color.theme.secondary)
        }
    }
    
    private func buildHomeView(_ coins: [Coin]) -> some View {
        VStack(spacing: 25) {
            TopBarSectionView()
            
            Divider()
            
            TotalAssetsValueSectionView()
            
            Divider()
            
            MyAssetsSectionView(coins)
            
            Divider()
            
            MarketsSectionView(coins: coins)
        }
    }
}

#Preview {
    HomeView()
}
