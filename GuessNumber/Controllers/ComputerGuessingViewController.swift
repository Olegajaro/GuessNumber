//
//  ComputerGuessingViewController.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

class ComputerGuessingViewController: UIViewController {

    lazy var game = Game(numberToGuess: numberToGuess)
    
    // MARK: - Variables
    var numberToGuess: Int!
    var computerCount: Int {
        return game.computerTriesCount
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var triesCountLabel: UILabel!
    @IBOutlet weak var guessingNumberLabel: UILabel!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessingNumberLabel.text = "Your number is - \(game.computerFirstGuess())?"
    }
    
    // MARK: - IBActions
    @IBAction func moreSignButtonTapped() {
        if numberToGuess < game.computer.computerVariant {
            showAlert(withTitle: "Hey", andMessage: "Don't cheat on the computer")
            return
        }
        updateLabels()
    }
    
    @IBAction func lessSignButtonTapped() {
        if numberToGuess > game.computer.computerVariant {
            showAlert(withTitle: "Hey", andMessage: "Don't cheat on the computer")
            return
        }
        updateLabels()
    }
    
    @IBAction func equalsButtonTapped() {
        if numberToGuess != game.computer.computerVariant {
            showAlert(
                withTitle: "Wrong",
                andMessage: "The number is not equal to the set value."
            )
        }
    }
    
    // MARK: - Private Methods
    private func updateLabels() {
        guessingNumberLabel.text = "Your number is - \(game.computerGuessingTheNumber())?"
        triesCountLabel.text = "Try № \(computerCount)"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let playerGuessingVC = segue.destination as? PlayerGuessingViewController
        else { return }
        
        playerGuessingVC.game = game
    }
}
