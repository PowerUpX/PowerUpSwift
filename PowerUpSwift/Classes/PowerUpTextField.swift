//
//  PowerUpTextField.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import UIKit

@IBDesignable
open class PowerUpTextField: UITextField {
    // MARK: - Length
    private var __maxLengths = [UITextField: Int]()
    
    // Swift does not provide a built-in max length property on text fields
    // This lets you set the max length in the Interface Builder under the Attributes inspector
    // Make sure you set the class of the textfield to PowerUpTextField
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
    
    // MARK: - UIView
    @IBInspectable open var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable open var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable open var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable open var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
