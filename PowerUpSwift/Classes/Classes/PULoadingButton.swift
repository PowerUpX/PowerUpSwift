//
//  PULoadingButton.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 4/21/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `PUButton` that allows the editing of additional UIKit properties via the Interface Builder.
@IBDesignable open class PULoadingButton: PUButton, PUXIBLocalizable {
    // MARK: - Inspectables
    /// PowerUpSwift: The opacity when the loading indicator is currently shown. Defaults to 0.5.
    @IBInspectable open var disabledAlpha: CGFloat = 0.5
    
    /// PowerUpSwift: The holder for the `UIButton`'s title when temporarily disabled.
    private var originalTitle: String?
    
    private var activityIndicatorView: UIActivityIndicatorView!
}

// MARK: - Custom Functions
extension PULoadingButton {
    /// PowerUpSwift: Displays the loading indicator to the center of the button and temporarily hides the button's title.
    open func showLoading() {
        // Clear out the title temporarily
        self.originalTitle = self.titleLabel?.text
        self.setTitle("", for: .normal)
        
        // Disable interactivity
        self.isEnabled = false
        self.alpha = self.disabledAlpha
        
        self.activityIndicatorView = UIActivityIndicatorView()
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.color = self.titleColor(for: .normal)
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.activityIndicatorView)
        
        let xCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: self.activityIndicatorView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        self.addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: self.activityIndicatorView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        
        self.addConstraint(yCenterConstraint)
        
        self.activityIndicatorView.startAnimating()
    }
    
    /// PowerUpSwift: Hides the loading indicator from the center of the button and displays the button's title back.
    open func hideLoading() {
        // Bring the title back
        self.setTitle(self.originalTitle, for: .normal)
        
        // Enable interactivity
        self.isEnabled = true
        self.alpha = 1.0
        
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.removeFromSuperview()
    }
}
