//
//  File.swift
//  
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import Foundation

public protocol LocalFileManagerInterface {
    func save(_ data: Data, folderName: String, fileName: String, withExtension fileExtension: String) throws
    func get(_ folderName: String, fileName: String, withExtension fileExtension: String) -> AnyPublisher<Data, LocalFileManagerError>
}

// MARK: Errors -
public enum DatabaseError: LocalizedError {
    case unableToFind(Error)
    case unableToSave(Error)
    case invalidContainer

    public var errorDescription: String? {
        switch self {
        case .unableToFind(let error): return "Error fetching Portfolio Entities! \(error.localizedDescription)"
        case .unableToSave(let error): return "Error saving to Core Data. \(error.localizedDescription)"
        case .invalidContainer: return "Invalid or missing persistent container."
        }
    }
}

public enum LocalFileManagerError: Error {
    case unableToAccessImage
    case unableToAccessURL
    case unableToConvertToData
    case unableToCreateDictionary
    case unableToFind
    case unableToSave
}
