//
//  PUSegmentedControl.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

@IBDesignable open class PUSegmentedControl: UISegmentedControl, PUXIBMultiLocalizable {
    @IBInspectable open var xibLocKeys: String? {
        didSet {
            guard let keys = self.xibLocKeys?.components(separatedBy: ","), !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                self.setTitle(title.localized, forSegmentAt: index)
            }
        }
    }
}
