//
//  UIButton.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UIButton {
    public func setEnabled(_ enable: Bool) {
        self.isEnabled = enable
        self.alpha = enable ? 1 : 0.5
    }
}
