//
//  ItemTests.swift
//  Cuenta+Tests
//
//  Created by Alex Dearden on 11/07/2024.
//

import XCTest
@testable import Cuenta_

final class ItemTests: XCTestCase {
    private var userManager: UserManager!
    private var sortedInterests: [InterestModel]!
    
    override func setUpWithError() throws {
        userManager = UserManager(
            user: .init(name: "Mariana", email: "mana@email.com", password: "mana"),
            isLoggedIn: true
        )
        
        sortedInterests = Defaults.allInterestsSorted
    }

    override func tearDownWithError() throws {
        userManager = nil
        sortedInterests = nil
    }
    
    func testSortedInterests() {
        XCTAssertEqual(sortedInterests.first?.name, "Communication")
    }
    
    func testAddInterest() {
        let interestToAdd = sortedInterests.first!
        userManager.addInterest(interestToAdd)
        XCTAssertEqual(userManager.interests.count, 1)
        XCTAssertEqual(userManager.interests.first?.name, "Communication")
    }

    func testRemoveInterest() {        
        userManager.addInterest(sortedInterests[0])
        userManager.addInterest(sortedInterests[3])
        XCTAssertEqual(userManager.interests.count, 2)
        userManager.removeInterest(sortedInterests[0])
        XCTAssertEqual(userManager.interests.count, 1)
        XCTAssertEqual(userManager.interests.first?.name, "Mental Health")
    }
}
