//
//  PUNavigationItem.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `UINavigationItem` that allows the editing of additional UIKit properties via the Interface Builder.
@IBDesignable open class PUNavigationItem: UINavigationItem, PUXIBLocalizable {
    // MARK: - Inspectables
    @IBInspectable open var xibLocKey: String? {
        didSet { self.title = self.xibLocKey?.localized }
    }
}
