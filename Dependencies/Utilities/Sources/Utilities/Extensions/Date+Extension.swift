//
//  Date+Extension.swift
//
//
//  Created by MaTooSens on 30/01/2024.
//

import Foundation

public extension Date {
    init(milliseconds: Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}
