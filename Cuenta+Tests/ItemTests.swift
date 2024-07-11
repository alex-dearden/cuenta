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
    
    override func setUpWithError() throws {
        userManager = UserManager(
            user: .init(name: "Mariana", email: "mana@email.com", password: "mana"),
            isLoggedIn: true
        )
     
    }

    override func tearDownWithError() throws {
        userManager = nil
    }
    
    func testSortedInterests() {
        let sortedInterests = Defaults.allInterestsSorted
        
        XCTAssertEqual(sortedInterests.first?.name, "Communication")
    }
    
    func testAddInterest() {
        let sortedInterests = Defaults.allInterestsSorted
        let interestToAdd = sortedInterests.first!
        userManager.addInterest(interestToAdd)
        XCTAssertEqual(userManager.interests.count, 1)
        XCTAssertEqual(userManager.interests.first?.name, "Communication")
    }

    func testRemoveInterest() {
        let sortedInterests = Defaults.allInterestsSorted
        userManager.addInterest(sortedInterests[0])
        userManager.addInterest(sortedInterests[3])
        XCTAssertEqual(userManager.interests.count, 2)
        userManager.removeInterest(sortedInterests[0])
        XCTAssertEqual(userManager.interests.count, 1)
        XCTAssertEqual(userManager.interests.first?.name, "Mental Health")
    }
}
