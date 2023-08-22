//
//  DataManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 22/08/2023.
//

import Foundation

protocol Fetchable {
    /// We don't care how this is imiplemented, just give us an array of Video back
    func getVideos() async throws -> ExternalVideos
}

protocol GenericFetchable {
    associatedtype V
    func getItems() -> [V]
}

struct VideoDataManager {
    enum DecodingError: Error {
        case fileNotFound
    }
    
    func getVideos() async throws -> ExternalVideos {
        do {
            if let localFile = Bundle.main.url(forResource: "videos", withExtension: "json") {
                let videos = try await URLSession.shared.decode(ExternalVideos.self, from: localFile)
                return videos
            } else {
                throw DecodingError.fileNotFound
            }
        } catch {
            print("Error: \(error.localizedDescription.debugDescription)")
            throw error
        }
    }
    
}
