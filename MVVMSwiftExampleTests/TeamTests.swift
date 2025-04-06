//  TeamTests.swift
//  MVVMSwiftExampleTests
//
//  Created by Dino Bartošák on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import XCTest
@testable import MVVMSwiftExample

class TeamTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTeamInitialization() {
        let team = Team(name: "Test Team", identifier: "test")
        
        XCTAssertEqual(team.name, "Test Team")
        XCTAssertEqual(team.identifier, "test")
        XCTAssertEqual(team.players.count, 0)
    }
    
    func testAddPlayer() {
        let team = Team(name: "Test Team", identifier: "test")
        let player = Player(name: "Test Player", identifier: "player")
        
        team.addPlayer(player)
        
        XCTAssertEqual(team.players.count, 1)
        XCTAssertTrue(team.containsPlayer(player))
    }
    
    func testContainsPlayer() {
        let team = Team(name: "Test Team", identifier: "test")
        let player = Player(name: "Test Player", identifier: "player")
        
        team.addPlayer(player)
        
        XCTAssertTrue(team.containsPlayer(player))
        
        let otherPlayer = Player(name: "Other Player", identifier: "other")
        XCTAssertFalse(team.containsPlayer(otherPlayer))
    }

}
