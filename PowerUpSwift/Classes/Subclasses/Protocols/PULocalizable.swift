//
//  PULocalizable.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: A protocol to localize basic controls in the Interface Builder.
public protocol PUXIBLocalizable {
    var xibLocKey: String? { get set }
}

/// PowerUpSwift: A protocol to localize multiple texts in the same control such as the segmented control in the Interface Builder.
public protocol PUXIBMultiLocalizable {
    var xibLocKeys: String? { get set }
}

/// PowerUpSwift: A protocol to localize the placeholder in the text fields and text views in the Interface Builder.
public protocol PUXIBPlaceholderLocalizable {
    var xibPlaceholderLocKey: String? { get set }
}
