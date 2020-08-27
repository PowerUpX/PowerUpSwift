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
        
        self.dismissKeyboardWhenTappedOutside()
        
        self.powerUpTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
 
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == self.powerUpTextField {
            if let email = self.powerUpTextField.text, email.isNotValidEmail && email.isNotEmpty {
                self.powerUpTextField.showErrorColor()
            } else {
                self.powerUpTextField.hideErrorColor()
            }
        }
    }
}
