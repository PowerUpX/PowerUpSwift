//
//  PUUnderlineTextField.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 11/6/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `PUBaseTextField` that allows the editing of additional UIKit properties via the Interface Builder.
/// This text field displays a bottom bar that appears like an underline.
/// ![PUUnderlineTextField Demo](https://user-images.githubusercontent.com/14148226/48306720-b3317800-e578-11e8-8b81-f982e4a05768.gif "PUUnderlineTextField Demo")
/// ## Attributes inspector
/// ![Attributes inspector](https://user-images.githubusercontent.com/14148226/48306835-7915a580-e57b-11e8-8c32-681d9100eaf2.png "Attributes inspector")
@IBDesignable open class PUUnderlineTextField: PUBaseTextField {
    private var underline = CALayer()
    
    // MARK: - Inspectables
    /// PowerUpSwift: The main color for the underline. Defaults to `.lightGray.`
    @IBInspectable open var underlineColor: UIColor = .lightGray
    
    /// PowerUpSwift: The height of the underline. Defaults to 1.
    @IBInspectable open var underlineHeight: CGFloat = 1
    
    /// PowerUpSwift: Enables or disables the highlight behavior when the text field is being focused on (first responder). Defaults to `false`.
    @IBInspectable open var isHighlightOn: Bool = false
    
    /// PowerUpSwift: The color of the underline when the text field is being focused on (first responder). Defaults to `UIView().tintColor`.
    @IBInspectable open var highlightColor: UIColor = UIView().tintColor
    
    /// PowerUpSwift: The color of the underline when `isShowingError` is `true`. Defaults to `.red`.
    @IBInspectable open var errorColor: UIColor = .red
    
    // MARK: Properties
    /// PowerUpSwift: Defaults to `false`.
    open var isShowingError = false
    
    // MARK: - Init
    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commonInit()
    }
    
    /// :nodoc:
    override public init(frame: CGRect) {
        super.init(frame: frame)

        self.commonInit()
    }
    
    /// :nodoc:
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.commonInit()
    }
    
    /// :nodoc:
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.borderStyle = .none

        self.underline.frame = CGRect(x: 0, y: self.frame.height - self.underlineHeight, width: UIScreen.main.bounds.width, height: self.frame.height)
        self.underline.borderColor = self.underlineColor.cgColor
		self.underline.borderWidth = self.underlineHeight

		self.layer.masksToBounds = true
        self.layer.addSublayer(self.underline)
    }
    
    // MARK: - Responders
    /// :nodoc:
    override open func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        if self.isHighlightOn && !self.isShowingError {
            self.underline.borderColor = self.highlightColor.cgColor
        }
        
        return true
    }
    
    /// :nodoc:
    override open func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        self.underline.borderColor = (self.isShowingError) ? self.errorColor.cgColor : self.underlineColor.cgColor
        
        return true
    }
}

// MARK: - Custom Functions
extension PUUnderlineTextField {
    /// PowerUpSwift: Sets the color of the underline to the specified error color and sets the property `isShowingError` to `true`.
    open func showErrorColor() {
        self.underline.borderColor = self.errorColor.cgColor
        self.isShowingError = true
    }
    
    /// PowerUpSwift: Removes the error color of the underline and sets the property `isShowingError` to `false`.
    /// - The underline color is set to the specified highlight color if it's the first responder and if `isHighlightOn` is enabled.
    /// - Otherwise, the underline gets set back to its original color.
    open func hideErrorColor() {
        if self.isFirstResponder && self.isHighlightOn {
            self.underline.borderColor = self.highlightColor.cgColor
        } else {
            self.underline.borderColor = self.underlineColor.cgColor
        }
        
        self.isShowingError = false
    }
}

extension PUUnderlineTextField {
    /// nodoc:
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Handle the color update of the layers when switching to or from dark mode
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                self.layer.setNeedsDisplay()
                self.underline.setNeedsDisplay()
            }
        }
    }
}
