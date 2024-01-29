//
//  JSONDecoder+Extension.swift
//  
//
//  Created by MaTooSens on 18/01/2024.
//

import Foundation

public extension JSONDecoder {
    convenience init(withKeyDecodingStategy keyDecodingStrategy: KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = keyDecodingStrategy
    }
}
