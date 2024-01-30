//
//  CoinImageView.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import CoinInterface
import SwiftUI

public struct CoinImageView: View {
    @StateObject private var viewModel: CoinImageViewModel
    
    public init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    public var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .loaded(let image):
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        case .error:
            Image(systemName: "questionmark")
                .foregroundStyle(Color.theme.secondary)
        }
    }
}

#Preview {
    CoinImageView(coin: .sample)
}
