//
//  UIViewController+Extensions.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

extension UIViewController {
    // MARK: - Show alert
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // MARK: - Setup dismiss keyboard gesture
    func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(
            target: self,
            action: #selector(viewTapped(_: ))
        )
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc private func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

