//
//  GuessNumberViewController.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

class GuessNumberViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var guessNumberTextField: UITextField! {
        didSet {
            guessNumberTextField.addDoneButton()
        }
    }
    @IBOutlet weak var enterNumberButton: UIButton! {
        didSet {
            enterNumberButton.isEnabled = false
        }
    }
    
    // MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDismissKeyboardGesture()
    }
    
    // MARK: - IBActions
    @IBAction func guessNumberTextFieldChanged(_ sender: UITextField) {
        guard let textValue = sender.text else { return }
        
        enterNumberButton.isEnabled = textValue.isEmpty ? false : true
    }
    
    @IBAction func enterNumberTapped() {
        guard let guessNumber = Int(guessNumberTextField.text ?? "") else { return }
        
        if !(1...100).contains(guessNumber) {
            showAlert(
                withTitle: "Wrong",
                andMessage: "The text field is empty or the values are not in the range 1...100"
            )
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let computerGuessingVC = segue.destination as? ComputerGuessingViewController,
            let guessNumber = Int(guessNumberTextField.text ?? "")
        else { return }
        
        computerGuessingVC.numberToGuess = guessNumber
    }
}
