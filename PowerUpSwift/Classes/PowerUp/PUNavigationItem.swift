//
//  PUNavigationItem.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

@IBDesignable open class PUNavigationItem: UINavigationItem, PUXIBLocalizable {
    @IBInspectable open var xibLocKey: String? {
        get { return nil }
        set(key) {
            self.title = key?.localized
        }
    }
}
