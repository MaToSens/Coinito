//
//  Double+Extensions.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Foundation

public extension Double {
    func asCurrencyWithDecimals(_ digits: Int = 6) -> String {
        currencyFormatter(digits).string(from: NSNumber(value: self)) ?? "N/A"
    }
    
    private func currencyFormatter(_ digits: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = digits
        return formatter
    }
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
    
    func asNumberString(_ digits: Int = 2) -> String {
        String(format: "%.\(digits)f", self)
    }
    
    func asPercentString(_ digits: Int = 1) -> String {
        asNumberString(digits) + "%"
    }
}


// MARK: Optional Double
public extension Optional where Wrapped == Double {
    func asCurrencyWithDecimals(_ digits: Int = 6) -> String {
        guard
            let unwrappedValue = self,
            let value = currencyFormatter(digits).string(from: NSNumber(value: unwrappedValue)) else {
            return "N/A"
        }
        
        return value
    }
    
    func asPercentString() -> String {
        if self != nil {
            return asNumberString() + "%"
        } else {
            return "N/A"
        }
    }
    
    func asNumberString() -> String {
        if let unwrappedValue = self {
            return String(format: "%.1f", unwrappedValue)
        } else {
            return "N/A"
        }
    }
    
    private func currencyFormatter(_ digits: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = digits
        return formatter
    }
}
