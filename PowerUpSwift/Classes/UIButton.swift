//
//  UIButton.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import UIKit

extension UIButton {
    public func setEnabled(_ enable: Bool) {
        self.isEnabled = enable
        self.alpha = enable ? 1 : 0.5
    }
}
