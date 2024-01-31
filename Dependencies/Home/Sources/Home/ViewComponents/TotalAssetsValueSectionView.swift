//
//  TotalAssetsValueSectionView.swift
//
//
//  Created by MaTooSens on 29/01/2024.
//

import Components
import SwiftUI

struct TotalAssetsValueSectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView("Total Assets Value")
            
            HStack {
                buildTotalAssetsValueContent()
                
                BlueButtonView("fetch") { }
            }
        }
        .padding(.horizontal)
    }
    
    private func buildTotalAssetsValueContent() -> some View {
        HStack(alignment: .firstTextBaseline) {
            CurrencyAmountView(amount: 123783.98, textStyle: .title)
            
            CoinTrendIndicatorView(0.31)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
