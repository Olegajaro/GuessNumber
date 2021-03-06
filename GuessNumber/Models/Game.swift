//
//  Game.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import Foundation

final class Game {
    
    let computer = Computer()
    
    private(set) var numberToGuess: Int
    
    private(set) var computerTriesCount = 1
    private(set) var playerTriesCount = 1
    
    init(numberToGuess: Int) {
        self.numberToGuess = numberToGuess
    }
    
    func computerFirstGuess() -> Int {
        computer.initiallyGuessingNumber()
    }
    
    func computerGuessingTheNumber() -> Int {
        if numberToGuess != computer.computerVariant {
            computerTriesCount += 1
        }
        
        return computer.computerGuessingNumber(numberToGuess: numberToGuess)
    }
    
    func computerSetsTheNumber() -> Int {
        computer.guessTheNumber()
    }
    
    func playerTriesToGuessTheNumber(numberToGuess: Int, playerNumber: Int) -> String {
        if numberToGuess != playerNumber {
            playerTriesCount += 1
        }
        
        if numberToGuess > playerNumber {
            return "No, my number is more than yours"
        } else if numberToGuess < playerNumber {
            return "No, my number is less than yours"
        }
    
        return " "
    }
    
    func getResult() -> String {
        if computerTriesCount > playerTriesCount {
            return "You win"
        } else if computerTriesCount < playerTriesCount {
            return "Computer win"
        } else {
            return "Draw"
        }
    }
}
