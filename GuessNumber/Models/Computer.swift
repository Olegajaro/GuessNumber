//
//  Computer.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import Foundation

final class Computer {
    
    private(set) var computerVariant = 0 {
        didSet {
            variants.append(computerVariant)
        }
    }
    
    private var computerInitiallyValue = 0
    private var left = 1
    private var right = 100
    
    private var variants: [Int] = []
    
    func initiallyGuessingNumber() -> Int {
        computerInitiallyValue = Int.random(in: left...right)
        
        if computerVariant == 0 {
            computerVariant = computerInitiallyValue
        }
        
        return computerVariant
    }
    
    func computerGuessingNumber(numberToGuess: Int) -> Int {
        
        if numberToGuess > computerVariant {
            if right <= computerVariant {
                computerInitiallyValue = getPenultimateValueFrom(array: variants)
                right = computerInitiallyValue - 1
            }
            
            left = computerVariant + 1
            computerVariant = search(Array(left...right)) ?? 0
            left = computerVariant
        } else if numberToGuess < computerVariant {
            if left >= computerVariant {
                computerInitiallyValue = getPenultimateValueFrom(array: variants)
                left = computerInitiallyValue + 1
            }
            
            right = computerVariant - 1
            computerVariant = search(Array(left...right)) ?? 0
            right = computerVariant
        }
        
        return computerVariant
    }
    
    func guessTheNumber() -> Int {
        return Int.random(in: 1...100)
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
    
    private func getPenultimateValueFrom(array: [Int]) -> Int {
        let lastIndex = array.index(before: array.endIndex)
        let index = array.index(before: lastIndex)
        
        return array[index]
    }
}
