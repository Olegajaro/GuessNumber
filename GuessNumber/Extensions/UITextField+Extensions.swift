//
//  UITextField+Extensions.swift
//  GuessNumber
//
//  Created by Олег Федоров on 29.04.2022.
//

import UIKit

extension UITextField {
    
    func addDoneButton() {
        let screenWidth = UIScreen.main.bounds.width
        let doneToolBar: UIToolbar = UIToolbar(frame: .init(
            x: 0, y: 0,
            width: screenWidth, height: 50
        ))
        doneToolBar.barStyle = .default
        
        let flexBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace, target: nil, action: nil
        )
        let doneBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(dismissKeyboard)
        )
        let items = [flexBarButtonItem, doneBarButtonItem]
        
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        inputAccessoryView = doneToolBar
    }
    
    @objc private func dismissKeyboard() {
        resignFirstResponder()
    }
}
