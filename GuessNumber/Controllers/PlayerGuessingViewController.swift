//
//  PlayerGuessingViewController.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

class PlayerGuessingViewController: UIViewController {

    // MARK: - Variables
    var game: Game!
    var numberToGuess: Int!
    
    var playerCount: Int {
        return game.playerTriesCount
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var triesCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var playerGuessingTextField: UITextField!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - IBActions
    @IBAction func guessButtonTapped() {
        updateUI()
    }
    
    // MARK: - Private Methods
    private func setup() {
        numberToGuess = game.computerSetsTheNumber()
        playerGuessingTextField.addDoneButton()
        setupDismissKeyboardGesture()
    }
    
    private func updateUI() {
        guard let guessNumber = Int(playerGuessingTextField.text ?? "") else { return }
        
        statusLabel.text = game.playerTriesToGuessTheNumber(
            numberToGuess: numberToGuess,
            playerNumber: guessNumber
        )
        triesCountLabel.text = "Try № \(playerCount)"
        
        if !(1...100).contains(guessNumber) {
            showAlert(
                withTitle: "Wrong",
                andMessage: "The text field is empty or the values are not in the range 1...100"
            )
        }
        
        if numberToGuess == guessNumber {
            performSegue(withIdentifier: "toResultScreen", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let gameResultVC = segue.destination as? GameResultViewController
        else { return }
        
        gameResultVC.game = game
    }
}
