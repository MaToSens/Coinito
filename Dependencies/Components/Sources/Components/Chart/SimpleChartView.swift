//
//  SimpleChartView.swift
//
//
//  Created by MaTooSens on 30/01/2024.
//

import Charts
import SwiftUI

struct SimpleChartView: View {
    private let chartData: [[Double]]
    private let maxY: Double
    private let minY: Double
    private let color: Color
    
    init(chartData: [[Double]], priceChangePercentage24H: Double?) {
        self.chartData = chartData
        
        let values = chartData.map { $0[1] }
        self.maxY = (values.max() ?? 0) * 1.01
        self.minY = (values.min() ?? 0) * 0.99
        self.color = (priceChangePercentage24H ?? 0 >= 0) ? .green : .red
    }
    
    var body: some View {
        Chart {
            ForEach(chartData, id: \.self) { data in
                LineMark(
                    x: .value("Time", Date(milliseconds: data[0])),
                    y: .value("Price", data[1])
                )
                .interpolationMethod(.catmullRom)
            }
            .foregroundStyle(color)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: minY...maxY)
    }
}
