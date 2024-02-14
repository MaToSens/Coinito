//
//  File.swift
//  
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import Foundation

public protocol FileStorageManagerInterface {
    func save(
        data: Data,
        folderName: String,
        fileName: String,
        withExtension fileExtension: String
    ) throws
    
    func retrieve(
        folderName: String,
        fileName: String,
        withExtension fileExtension: String
    ) -> AnyPublisher<Data, FileStorageManagerError>
}

// MARK: Errors -
public enum FileStorageManagerError: Error {
    case unableToAccessURL
    case unableToConvertToData(Error)
    case unableToCreateDirectory
    case unableToFind
    case unableToSave
}
