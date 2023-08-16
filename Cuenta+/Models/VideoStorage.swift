//
//  VideoStorage.swift
//  Cuenta+
//
//  Created by Alex Dearden on 16/08/2023.
//

import Foundation

// TODO: We need a view model that owns [Video]
// and is responsible for updating and manipulating them
class VideoStorage: ObservableObject {
    @Published var videos: [Video] = []
    
    init(videos: [Video]) {
        self.videos = videos
    }
    
    #if DEBUG
    static var mockVideos: [Video] {
        return [
            Video(name: "Primero", icon: .videoImage, author: "Mariana Branger"),
            Video(name: "Segundo", icon: .regularImage, author: "Sasha Dearden")
        ]
    }
    #endif
}
