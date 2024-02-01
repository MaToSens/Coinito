//
//  Bundle+Extension.swift
//
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import Foundation

public extension Bundle {
    func decodable<T: Decodable>(
        fileName: String,
        withExtension fileExtension: String
    ) -> AnyPublisher<T, Error> {
        readFile(fileName: fileName, withExtension: fileExtension)
            .decode(
                type: T.self,
                decoder: JSONDecoder(withKeyDecodingStrategy: .convertFromSnakeCase)
            )
            .eraseToAnyPublisher()
    }
    
    private func readFile(
        fileName: String,
        withExtension fileExtension: String
    ) -> AnyPublisher<Data, Error> {
        url(forResource: fileName, withExtension: fileExtension)
            .publisher
            .tryMap {
                guard let data = try? Data(contentsOf: $0) else {
                    throw CocoaError(.fileReadCorruptFile)
                }
                
                return data
            }
            .eraseToAnyPublisher()
    }
}
