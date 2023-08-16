//
//  VideoStorage.swift
//  Cuenta+
//
//  Created by Alex Dearden on 16/08/2023.
//

import Foundation

///: This class will own the Videos array
/// and is responsible for updating and manipulating them
/// it will get added as an `@EnvironmentObject` from the App launch file

class VideoStorage: ObservableObject {
    @Published var items: [Video] = []
    
    init(items: [Video]) {
        self.items = items
    }

    func add(item: Video) {
        items.append(item)
    }

    func remove(item: Video) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
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
