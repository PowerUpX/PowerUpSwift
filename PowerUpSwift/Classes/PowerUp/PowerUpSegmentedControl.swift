//
//  PowerUpSegmentedControl.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

@IBDesignable open class PowerUpSegmentedControl: UISegmentedControl, PUXIBMultiLocalizable {
    @IBInspectable open var xibLocKeys: String? {
        get { return nil }
        set(keys) {
            guard let keys = keys?.components(separatedBy: ","), !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                self.setTitle(title.localized, forSegmentAt: index)
            }
        }
    }
}
