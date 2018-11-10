//
//  PowerUpBaseTextField.swift
//  Pods
//
//  Created by Ceferino Jose II on 11/11/18.
//

import UIKit

/// The base class for the PowerUpTextFields that reduces the risk of code duplication.
@IBDesignable
open class PowerUpBaseTextField: UITextField {
    // MARK: - Inset
    @IBInspectable open var leftInset: CGFloat {
        get {
            return self.leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
    @IBInspectable open var rightInset: CGFloat {
        get {
            return self.rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    // MARK: - Length
    private var __maxLengths = [UITextField: Int]()
    
    // Swift does not provide a built-in max length property on text fields.
    // This lets you set the max length in the Interface Builder under the Attributes inspector.
    // Make sure you set the class of the textfield to PowerUpTextField.
    @IBInspectable open var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return Int.max // (150 for global default-limit or use Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(self.limit), for: .editingChanged)
        }
    }
    
    @objc func limit(textField: UITextField) {
        let t = textField.text
        textField.text = t?.limitLength(maxLength)
    }
}
