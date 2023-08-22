//
//  Cuenta_Tests.swift
//  Cuenta+Tests
//
//  Created by Alex Dearden on 17/07/2023.
//

import XCTest
@testable import Cuenta_

final class Cuenta_Tests: XCTestCase {
    private var dataManager: VideoDataManager!

    override func setUpWithError() throws {
        dataManager = VideoDataManager()
     
    }

    override func tearDownWithError() throws {
        dataManager = nil
    }
    
    func testFetch() async {
        let mainObject = try! await dataManager.getVideos()
        
        XCTAssertFalse(mainObject.videos.isEmpty)
        XCTAssertTrue(mainObject.videos.count > 0)
    }

}
