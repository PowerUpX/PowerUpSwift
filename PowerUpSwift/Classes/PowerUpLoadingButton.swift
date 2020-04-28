//
//  PowerUpLoadingButton.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 4/21/20.
//

import UIKit

@IBDesignable
open class PowerUpLoadingButton: PowerUpButton {
    /// The `alpha` value when showing the loading indicator.
    @IBInspectable open var disabledAlpha: CGFloat = 0.5
    
    /// The holder for the `UIButton`'s title when temporarily disabled.
    private var originalTitle: String?
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
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
