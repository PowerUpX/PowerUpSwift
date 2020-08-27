//
//  UIViewController.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UIViewController {
    /// PowerUpSwift: Hides the keyboard when tapped outside the text field.
    public func dismissKeyboardWhenTappedOutside() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    /// PowerUpSwift: A syntactic sugar to access UIViewController's `navigationController` property.
    /// - Some developers name their view controllers with something like `someVC` instead of `someViewController`.
    /// - This comes in handy since it will make the code more streamlined.
    public var navVC: UINavigationController? {
        return self.navigationController
    }
}
