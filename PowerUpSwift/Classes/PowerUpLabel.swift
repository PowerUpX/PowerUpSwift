//
//  PowerUpLabel.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import UIKit

@IBDesignable
open class PowerUpLabel: UILabel {
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
}

