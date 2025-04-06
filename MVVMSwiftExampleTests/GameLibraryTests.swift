//  GameLibraryTests.swift
//  MVVMSwiftExampleTests
//
//  Created by Dino Bartošák on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import XCTest
@testable import MVVMSwiftExample

class GameLibraryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAllGames() {
        let gameLibrary = InMemoryGameLibrary()
        let games = gameLibrary.allGames()
        XCTAssertNotNil(games)
        XCTAssertGreaterThan(games.count, 0)
    }
    
    func testAddGame() {
        let gameLibrary = InMemoryGameLibrary()
        let initialGameCount = gameLibrary.allGames().count
        
        let homeTeam = Team(name: "Home Team", identifier: "home")
        let awayTeam = Team(name: "Away Team", identifier: "away")
        let newGame = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: "new")
        
        gameLibrary.addGame(newGame)
        
        XCTAssertEqual(gameLibrary.allGames().count, initialGameCount + 1)
    }
    
    func testRemoveGame() {
        let gameLibrary = InMemoryGameLibrary()
        let initialGameCount = gameLibrary.allGames().count
        
        let gameToRemove = gameLibrary.allGames().first!
        
        gameLibrary.removeGame(gameToRemove)
        
        XCTAssertEqual(gameLibrary.allGames().count, initialGameCount - 1)
    }

    func testFindGame() {
        let gameLibrary = InMemoryGameLibrary()
        let homeTeam = Team(name: "Home Team", identifier: "home")
        let awayTeam = Team(name: "Away Team", identifier: "away")
        let newGame = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: "find")
        gameLibrary.addGame(newGame)

        let foundGame = gameLibrary.findGame(withIdentifier: "find")
        XCTAssertNotNil(foundGame)
        XCTAssertEqual(foundGame?.identifier, "find")
    }
    
    func testUpdateGame() {
        let gameLibrary = InMemoryGameLibrary()
        let gameToUpdate = gameLibrary.allGames().first!
        
        let newHomeTeam = Team(name: "New Home Team", identifier: "newHome")
        gameToUpdate.homeTeam = newHomeTeam
        
        gameLibrary.updateGame(gameToUpdate)
        
        let updatedGame = gameLibrary.allGames().first { $0.identifier == gameToUpdate.identifier }
        
        XCTAssertEqual(updatedGame?.homeTeam.name, "New Home Team")
    }

}
