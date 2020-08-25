//
//  PUBaseTextField.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 11/11/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `UITextField` that allows the editing of additional UIKit properties via the Interface Builder.
/// This is not usually used as a direct custom class of a control via the Inteface Builder.
/// Use the classes `PUTextField` and `PUUnderlineTextField` instead.
@IBDesignable open class PUBaseTextField: UITextField, PUXIBPlaceholderLocalizable {
    // MARK: - Inspectables
    @IBInspectable open var xibPlaceholderLocKey: String? {
        didSet { self.placeholder = self.xibPlaceholderLocKey?.localized }
    }
    
    /// PowerUpSwift: The left padding.
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
    
    /// PowerUpSwift: The right padding.
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
    
    /// PowerUpSwift: Allows the setting of the max length via the Interface Builder.
    /// This is handy since Swift does not provide a built-in max length property on text fields.
    @IBInspectable open var maxLength: Int {
        get {
            guard let l = self.__maxLengths[self] else {
                return Int.max // (150 for global default-limit or use Int.max)
            }
            return l
        }
        set {
            self.__maxLengths[self] = newValue
            addTarget(self, action: #selector(self.limit), for: .editingChanged)
        }
    }
    
    private var __maxLengths = [UITextField: Int]()
    
    @objc func limit(textField: UITextField) {
        textField.text = textField.text?.limitLength(self.maxLength)
    }
}

fileprivate extension String {
    func limitLength(_ n: Int) -> String {
        if self.count <= n { return self }
        
        return String(Array(self).prefix(upTo: n))
    }
}
