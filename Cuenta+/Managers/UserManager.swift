//
//  UserManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

/// # We don't need this protocol if we are using `Stack<Element>`
/// `Stack`'s have their own push and pop methods for handling elements
protocol UserManageable {
    mutating func addInterest(_ item: Interest)
    mutating func removeInterest(_ item: Interest)
    mutating func addVideo(_ item: ExternalVideo)
    mutating func removeVideo(_ item: ExternalVideo)
}

struct UserManager: UserManageable {
    let user: User
    var isLoggedIn: Bool
    var videos: [ExternalVideo]
    var interests: [Interest]
    
    // TODO: perhaps a generic method for append and remove so we don't have to duplicate code below?
    mutating func addInterest(_ item: Interest) {
        interests.append(item)
    }
    
    mutating func removeInterest(_ item: Interest) {
        interests.removeAll(where: { $0 == item })
    }
    
    mutating func addVideo(_ item: ExternalVideo) {
        videos.append(item)
    }
    
    mutating func removeVideo(_ item: ExternalVideo) {
        videos.removeAll(where: { $0 == item })
    }    
}
