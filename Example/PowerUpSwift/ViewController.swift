//
//  ViewController.swift
//  PowerUpSwift
//
//  Created by cefjoeii on 10/10/2018.
//  Copyright (c) 2018 cefjoeii. All rights reserved.
//

import UIKit
import PowerUpSwift

class ViewController: UIViewController {
    @IBOutlet weak var powerUpTextField: PUUnderlineTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissKeyboardWhenTappedOutside()
        
        powerUpTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
 
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == powerUpTextField {
            if let email = powerUpTextField.text, email.isNotValidEmail && email.isNotEmpty {
                powerUpTextField.showErrorColor()
            } else {
                powerUpTextField.hideErrorColor()
            }
        }
    }
}
