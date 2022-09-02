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
        originalTitle = titleLabel?.text
        setTitle("", for: .normal)
        
        // Disable interactivity
        isEnabled = false
        alpha = disabledAlpha
        
        activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = titleColor(for: .normal)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(activityIndicatorView)
        
        let xCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: activityIndicatorView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0
        )
        
        addConstraint(xCenterConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(
            item: self,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: activityIndicatorView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0
        )
        
        addConstraint(yCenterConstraint)
        
        activityIndicatorView.startAnimating()
    }
    
    /// PowerUpSwift: Hides the loading indicator from the center of the button and displays the button's title back.
    open func hideLoading() {
        // Bring the title back
        setTitle(originalTitle, for: .normal)
        
        // Enable interactivity
        isEnabled = true
        alpha = 1.0
        
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
    }
}
