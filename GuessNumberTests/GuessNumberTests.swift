//
//  GuessNumberTests.swift
//  GuessNumberTests
//
//  Created by Олег Федоров on 29.04.2022.
//

import XCTest
@testable import GuessNumber

class GuessNumberTests: XCTestCase {
    
    var sut: Game!

    override func setUpWithError() throws {
        sut = Game(numberToGuess: 23)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Computer_Initially_Tries_To_Guess_Number_From_Correct_Range() {
        XCTAssertTrue((1...100).contains(sut.computerFirstGuess()))
    }
    
    func test_Computer_Sets_Value_In_The_Correct_Range() {
        XCTAssertTrue((1...100).contains(sut.computerSetsTheNumber()))
    }
    
    func test_Computer_Attempts_Counting() {
        let result = sut.computerGuessingTheNumber()

        if result != sut.numberToGuess {
            XCTAssertEqual(sut.computerTriesCount, 2)
        } else {
            XCTAssertEqual(sut.computerTriesCount, 1)
        }
    }
    
    func test_Player_Attempts_Counting() {
        let _ = sut.playerTriesToGuessTheNumber(numberToGuess: sut.numberToGuess,
                                                playerNumber: 25)
        
        XCTAssertEqual(sut.playerTriesCount, 2)
    }
    
    func test_Display_Hint_If_Players_Number_Greater_Than_Number_Set_By_Computer() {
        XCTAssertEqual(
            sut.playerTriesToGuessTheNumber(numberToGuess: sut.numberToGuess, playerNumber: 25),
            "No, my number is less than yours"
        )
    }
    
    func test_Display_Hint_If_Players_Number_Less_Than_Number_Set_By_Computer() {
      XCTAssertEqual(
            sut.playerTriesToGuessTheNumber(numberToGuess: sut.numberToGuess, playerNumber: 21),
            "No, my number is more than yours"
        )
    }
}
