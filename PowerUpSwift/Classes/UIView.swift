//
//  UIView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/15/18.
//

import UIKit

extension UIView {
    /// Returns the first height constraint of the view.
    public var heightConstraint: NSLayoutConstraint? {
        get {
            return constraints.filter {
                if $0.firstAttribute == .height, $0.relation == .equal {
                    return true
                }
                return false
                }.first
        }
        set {
            self.setNeedsLayout()
        }
    }
    
    /// Returns the first width constraint of the view.
    public var widthConstraint: NSLayoutConstraint? {
        get {
            return constraints.filter {
                if $0.firstAttribute == .width, $0.relation == .equal {
                    return true
                }
                return false
                }.first
        }
        set {
            self.setNeedsLayout()
        }
    }
}
