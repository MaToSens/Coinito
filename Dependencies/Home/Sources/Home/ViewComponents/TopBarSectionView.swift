//
//  TopBarSectionView.swift
//  
//
//  Created by MaTooSens on 30/01/2024.
//

import Components
import Design
import SwiftUI

struct TopBarSectionView: View {
    var body: some View {
        HStack {
            AppIdentityView(.logoWithName)
            
            Spacer()
            
            RoundedBackgroundImageView("search")
            
            RoundedBackgroundImageView("notification")
        }
        .padding(.horizontal)
    }
}
