//
//  DataManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 22/08/2023.
//

import Foundation

protocol Fetchable {
    /// We don't care how this is imiplemented, just give us an array of Video back
    func getVideos() async -> [ExternalVideo]
}

protocol GenericFetchable {
    associatedtype V
    func getItems() -> [V]
}

struct VideoDataManager: Fetchable {
    func getVideos() async -> [ExternalVideo] {
        do {
            let videos = try await URLSession.shared.decode([ExternalVideo].self, from: Bundle.main.url(forResource: "videos", withExtension: "json")!)
            return videos
        } catch {
            print("Error: \(error)")
        }
        
        return []
    }
    
}
