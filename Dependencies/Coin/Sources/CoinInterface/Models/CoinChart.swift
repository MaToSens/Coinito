//
//  CoinChart.swift
//  
//
//  Created by MaTooSens on 29/01/2024.
//

import Foundation

public struct CoinChart: Codable {
    public let prices: [[Double]]
    public let marketCaps: [[Double]]
    public let totalVolumes: [[Double]]
}
