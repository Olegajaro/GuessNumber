//
//  UIViewController+Extensions.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

