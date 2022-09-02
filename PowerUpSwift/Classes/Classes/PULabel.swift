//
//  PULabel.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `UILabel` that allows the editing of additional UIKit properties via the Interface Builder.
@IBDesignable open class PULabel: UILabel, PUXIBLocalizable, PUInspectable {
    // MARK: - Inspectables
    @IBInspectable open var xibLocKey: String? {
        didSet { text = xibLocKey?.localized }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        didSet { layer.borderColor = borderColor?.cgColor }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet { layer.shadowRadius = shadowRadius }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet { layer.shadowOpacity = shadowOpacity }
    }
    
    /// PowerUpSwift: The top padding. Defaults to 0.
    @IBInspectable open var topInset: CGFloat = 0
    
    /// PowerUpSwift: The left padding. Defaults to 0.
    @IBInspectable open var leftInset: CGFloat = 0
    
    /// PowerUpSwift: The bottom padding. Defaults to 0.
    @IBInspectable open var bottomInset: CGFloat = 0
    
    /// PowerUpSwift: The right padding. Defaults to 0.
    @IBInspectable open var rightInset: CGFloat = 0
    
    // MARK: - Custom Properties
    /**
     PowerUpSwift: The padding on all sides that is set programmatically.
     ### Example
     ```
     powerUpLabel.insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
     ```
     */
    open var insets: UIEdgeInsets {
        get {
            return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        }
        set {
            topInset = newValue.top
            leftInset = newValue.left
            bottomInset = newValue.bottom
            rightInset = newValue.right
        }
    }
    
    /// :nodoc:
    override open func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    /// :nodoc:
    override open var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + leftInset + rightInset,
            height: size.height + topInset + bottomInset
        )
    }
}

extension PULabel {
    /// :nodoc:
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Handle the color update when switching to or from dark mode
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                layer.setNeedsDisplay()
            }
        }
    }
}
