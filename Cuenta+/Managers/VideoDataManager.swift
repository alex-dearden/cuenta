//
//  DataManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 22/08/2023.
//

import Foundation

protocol Fetchable {
    /// We don't care how this is imiplemented, just give us an array of Video back
    func getVideos() -> [Video]
}

struct VideoDataManager: Fetchable {
    func getVideos() -> [Video] {
        
    }
    
}
