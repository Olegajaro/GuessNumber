//
//  GameResultViewController.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

class GameResultViewController: UIViewController {

    var game: Game!
    
    @IBOutlet weak var playerTriesCountLabel: UILabel!
    @IBOutlet weak var computerTriesCountLabel: UILabel!
    @IBOutlet weak var gameResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackBarButton()
        setup()
    }
    
    private func setup() {
        playerTriesCountLabel.text = "Your's tries count: \(game.playerTriesCount)"
        computerTriesCountLabel.text = "Computer's tries count: \(game.computerTriesCount)"
        gameResultLabel.text = game.getResult()
    }
}
