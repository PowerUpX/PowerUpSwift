//
//  PowerUpUnderlineTextField.swift
//  Pods
//
//  Created by Ceferino Jose II on 11/6/18.
//

import UIKit

@IBDesignable
open class PowerUpUnderlineTextField: PowerUpBaseTextField {
    private var underline = CALayer()
    
    // MARK: - Inspectables
    @IBInspectable open var underlineColor: UIColor = .lightGray
    @IBInspectable open var underlineHeight: CGFloat = 1
    @IBInspectable open var isHighlightOn: Bool = false
    @IBInspectable open var highlightColor: UIColor = UIView().tintColor
    @IBInspectable open var errorColor: UIColor = .red
    
    // MARK: Properties
    open var isShowingError = false
    
    // MARK: - Init
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.commonInit()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.borderStyle = .none

        self.underline.frame = CGRect(x: 0, y: self.frame.height - self.underlineHeight, width: self.frame.width, height: self.underlineHeight)
        self.underline.backgroundColor = self.underlineColor.cgColor

        self.layer.addSublayer(self.underline)
    }
    
    // MARK: - Responders
    override open func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        if self.isHighlightOn && !self.isShowingError {
            self.underline.backgroundColor = self.highlightColor.cgColor
        }
        
        return true
    }
    
    override open func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        self.underline.backgroundColor = (self.isShowingError) ? self.errorColor.cgColor : self.underlineColor.cgColor
        
        return true
    }
    
    // MARK: - Custom Functions
    /// Sets the color of the underline to the specified error color and sets the property `isShowingError` to `true`.
    open func showErrorColor() {
        self.underline.backgroundColor = self.errorColor.cgColor
        self.isShowingError = true
    }
    
    /// Removes the error color of the underline and sets the property `isShowingError` to `false`.
    /// The underline color is set to the specified highlight color if it's the first responder and if `isHighlightOn` is enabled.
    /// Otherwise, the underline gets set back to its original color.
    open func hideErrorColor() {
        if self.isFirstResponder && self.isHighlightOn {
            self.underline.backgroundColor = self.highlightColor.cgColor
        } else {
            self.underline.backgroundColor = self.underlineColor.cgColor
        }
        
        self.isShowingError = false
    }
}
