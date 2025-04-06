//  GameTests.swift
//  MVVMSwiftExampleTests
//
//  Created by Dino Bartošák on 25/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import XCTest
@testable import MVVMSwiftExample

class GameTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGameInitialization() {
        let homeTeam = Team(name: "Home Team", identifier: "home")
        let awayTeam = Team(name: "Away Team", identifier: "away")
        let game = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: "test")
        
        XCTAssertEqual(game.homeTeam.name, "Home Team")
        XCTAssertEqual(game.awayTeam.name, "Away Team")
        XCTAssertEqual(game.homeTeamScore, 0)
        XCTAssertEqual(game.awayTeamScore, 0)
        XCTAssertFalse(game.isFinished)
    }

    func testGameIsFinished() {
        let homeTeam = Team(name: "Home Team", identifier: "home")
        let awayTeam = Team(name: "Away Team", identifier: "away")
        let game = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: "test")

        // ゲームが終了していないことを確認
        XCTAssertFalse(game.isFinished)

        // スコアを設定してゲームを終了させる (例)
        game.homeTeamScore = 10
        game.awayTeamScore = 10
        game.isFinished = true

        // ゲームが終了していることを確認
        XCTAssertTrue(game.isFinished)
    }
    
    func testAddPlayerMove() {
        let homeTeam = Team(name: "Home Team", identifier: "home")
        let awayTeam = Team(name: "Away Team", identifier: "away")
        let game = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: "test")
        let player = Player(name: "Player 1", identifier: "player1")
        homeTeam.addPlayer(player)
        
        game.addPlayerMove(.onePoint, for: player)
        
        XCTAssertEqual(game.homeTeamScore, 1)
        XCTAssertEqual(game.playerMoveCount(for: player, move: .onePoint), 1)
    }
    
    func testIsScoringMove() {
        XCTAssertTrue(Game.isScoringMove(.onePoint))
        XCTAssertTrue(Game.isScoringMove(.twoPoints))
        XCTAssertFalse(Game.isScoringMove(.assist))
        XCTAssertFalse(Game.isScoringMove(.rebound))
        XCTAssertFalse(Game.isScoringMove(.foul))
    }

}
