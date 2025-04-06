//  PlayerTests.swift
//  MVVMSwiftExampleTests
//
//  Created by Dino Bartošák on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import XCTest
@testable import MVVMSwiftExample

class PlayerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPlayerInitialization() {
        let player = Player(name: "Test Player", identifier: "test")
        
        XCTAssertEqual(player.name, "Test Player")
        XCTAssertEqual(player.identifier, "test")
    }

}
