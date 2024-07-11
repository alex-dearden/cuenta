//
//  DataManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 22/08/2023.
//

import Foundation

protocol Fetchable {
    /// We don't care how this is imiplemented, just give us an array of Video back
    /// though we are specifying that it should be async which maybe infers a bit too much...
    func getVideos() async throws -> ExternalVideos
}

protocol GenericFetchable {
    associatedtype V
    func getItems() -> [V]
}

struct MyActors: Decodable {
    
}

struct VideoDataManager {
    enum DecodeError: Error {
        case unknown
    }

    func getVideos() async throws -> [ExternalVideo] {
        do {            
            let localFile = Bundle.main.url(forResource: "videos", withExtension: "json")!
            let decodedObject = try await URLSession.shared.decode(ExternalVideos.self, from: localFile)
            let videos = decodedObject.videos
            
            return videos
            
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
            throw error
        }
        
        throw DecodeError.unknown
    }
}
