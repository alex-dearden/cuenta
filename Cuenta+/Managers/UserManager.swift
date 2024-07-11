//
//  UserManager.swift
//  Cuenta+
//
//  Created by Alex Dearden on 29/08/2023.
//

/// # We don't need this protocol if we are using `Stack<Element>`
/// `Stack`'s have their own push and pop methods for handling elements
protocol UserManageable {
    func addInterest(_ item: InterestModel)
    func removeInterest(_ item: InterestModel)
    func addVideo(_ item: ExternalVideo)
    func removeVideo(_ item: ExternalVideo)
}

class UserManager: UserManageable {
    let user: User
    var isLoggedIn: Bool
    var videos: [ExternalVideo]
    var interests: [InterestModel]
    
    init(user: User, isLoggedIn: Bool = false, videos: [ExternalVideo] = [], interests: [InterestModel] = []) {
        self.user = user
        self.isLoggedIn = isLoggedIn
        self.videos = videos
        self.interests = interests
    }
    
    // TODO: perhaps a generic method for append and remove so we don't have to duplicate code below?
    func addInterest(_ item: InterestModel) {
        interests.append(item)
        debugPrint("\(item.name) ADDED from selectedItems, array is now: \(interests.map { $0.name })")
    }
    
    func removeInterest(_ item: InterestModel) {
        interests.removeAll(where: { $0 == item })
        debugPrint("\(item.name) REMOVED from selectedItems, array is now: \(interests.map { $0.name })")
    }
    
    func addVideo(_ item: ExternalVideo) {
        videos.append(item)
    }
    
    func removeVideo(_ item: ExternalVideo) {
        videos.removeAll(where: { $0 == item })
    }    
}

extension UserManager {
    // MARK: Testing
    static let testUserManager = UserManager(
        user: .init(name: "Mariana", email: "mana@email.com", password: "mana"),
        isLoggedIn: true
    )
}

