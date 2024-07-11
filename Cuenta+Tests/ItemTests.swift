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

}
