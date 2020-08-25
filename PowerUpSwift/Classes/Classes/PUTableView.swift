//
//  PUTableView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/25/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `UITableView` that allows the editing of additional UIKit properties via the Interface Builder.
@IBDesignable open class PUTableView: UITableView, PUInspectable {
    // MARK: - Inspectables
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
    
    @IBInspectable open var shadowOffset: CGSize = .zero {
        didSet { self.layer.shadowOffset = self.shadowOffset }
    }
    
    @IBInspectable open var shadowColor: UIColor? {
        didSet { self.layer.shadowColor = self.shadowColor?.cgColor }
    }
}

extension PUTableView {
    /// :nodoc:
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

