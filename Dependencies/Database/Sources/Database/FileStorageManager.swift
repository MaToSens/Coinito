//
//  FileStorageManager.swift
//
//
//  Created by MaTooSens on 27/01/2024.
//

import Combine
import DatabaseInterface
import SwiftUI

final class FileStorageManager: FileStorageManagerInterface {
    private let fileManager = FileManager.default
    
    func save(
        _ data: Data,
        folderName: String,
        fileName: String,
        withExtension fileExtension: String
    ) throws {
        try createFolderIfNeeded(folderName)
        
        let fileURL = try urlForData(folderName: folderName, fileName: fileName, withExtension: fileExtension)
        
        do {
            try data.write(to: fileURL)
        } catch {
            throw FileStorageManagerError.unableToSave
        }
    }
    
    func retrieve(
        _ folderName: String,
        fileName: String,
        withExtension fileExtension: String
    ) -> AnyPublisher<Data, FileStorageManagerError> {
        do {
            let fileURL = try urlForData(folderName: folderName, fileName: fileName, withExtension: fileExtension)
        
            guard fileManager.fileExists(atPath: fileURL.path()) else {
                throw FileStorageManagerError.unableToFind
            }
            
            let data = try Data(contentsOf: fileURL)

            return Just(data)
                .setFailureType(to: FileStorageManagerError.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: .unableToConvertToData(error))
                .eraseToAnyPublisher()
        }
    }
}

// MARK: Helper Functions
private extension FileStorageManager {
    func createFolderIfNeeded(_ folderName: String) throws {
        let folderPath = try urlForFolder(folderName).path()
        
        if !FileManager.default.fileExists(atPath: folderPath) {
            do {
                try fileManager.createDirectory(atPath: folderPath, withIntermediateDirectories: true)
            } catch {
                throw FileStorageManagerError.unableToCreateDirectory
            }
        }
    }
    
    func urlForData(
        folderName: String,
        fileName: String,
        withExtension fileExtension: String
    ) throws -> URL {
        try urlForFolder(folderName).appending(path: fileName + fileExtension)
    }
    
    func urlForFolder(_ folderName: String) throws -> URL {
        guard let url = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            throw FileStorageManagerError.unableToAccessURL
        }
        
        return url.appending(path: folderName)
    }
}
