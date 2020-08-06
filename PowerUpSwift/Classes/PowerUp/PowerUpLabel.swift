//
//  PowerUpLabel.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

@IBDesignable open class PowerUpLabel: UILabel, PUXIBLocalizable {
    @IBInspectable open var xibLocKey: String? {
        get { return nil }
        set(key) {
            self.text = key?.localized
        }
    }
    
    @IBInspectable open var topInset: CGFloat = 0.0
    @IBInspectable open var leftInset: CGFloat = 0.0
    @IBInspectable open var bottomInset: CGFloat = 0.0
    @IBInspectable open var rightInset: CGFloat = 0.0
    
    /**
     PowerUpLabel's UIEdgeInsets value can be set programmatically.
     ### Example
     ```
     self.powerUpLabel.insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     ```
     */
    open var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        }
        set {
            self.topInset = newValue.top
            self.leftInset = newValue.left
            self.bottomInset = newValue.bottom
            self.rightInset = newValue.right
        }
    }
    
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: self.insets))
    }
    
    override open var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    // MARK: - View
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet { self.layer.cornerRadius = self.cornerRadius }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet { self.layer.borderWidth = self.borderWidth }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        didSet { self.layer.borderColor = self.borderColor?.cgColor }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet { self.layer.shadowRadius = self.shadowRadius }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet { self.layer.shadowOpacity = self.shadowOpacity }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Handle the color update when switching to or from dark mode
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                self.layer.setNeedsDisplay()
            }
        }
    }
}

