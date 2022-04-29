//
//  Computer.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import Foundation

final class Computer {
    
    private(set) var computerVariant = 0
    
    private var computerInitallyValue = 0
    private var left = 1
    private var right = 100
    
    func initiallyGuessingNumber() -> Int {
        computerInitallyValue = Int.random(in: left...right)
        return computerInitallyValue
    }
    
    func computerGuessingNumber(numberToGuess: Int) -> Int {
        if computerVariant == 0 {
            computerVariant = computerInitallyValue
        }
        
        if numberToGuess > computerVariant {
            if (right - 1) == left {
                right = computerVariant + 1
            }
            
            if right <= computerVariant {
                right = computerInitallyValue
                computerInitallyValue = computerVariant
            }
            
            left = computerVariant
            let listNumber = Array((computerVariant + 1)...right)
            computerVariant = search(listNumber) ?? 0
            left = computerVariant
        } else if numberToGuess < computerVariant {
            if left >= computerVariant {
                left = computerInitallyValue
                computerInitallyValue = computerVariant
            }
            
            right = computerVariant
            let listNumber = Array(left...(computerVariant - 1))
            computerVariant = search(listNumber) ?? 0
            right = computerVariant
        } else {
            return computerVariant
        }
        
        return computerVariant
    }
    
    func guessTheNumber() -> Int {
        let setNumber = Int.random(in: 1...100)
        
        return setNumber
    }
    
    private func search(_ array: [Int]) -> Int? {
        
        guard !array.isEmpty else {
            return nil
        }
        
        let left: Int = 0
        let right: Int = array.count - 1
        
        if left <= right {
            let middleIndex = (left + right) / 2
            let middleValue = array[middleIndex]
            
            return middleValue
        }
        
        return nil
    }
    
}
