//
//  PULocalizable.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

public protocol PULocalizable {
    var localized: String { get }
    func localized(in bundle: Bundle?, comment: String) -> String
}

/// Protocol to localize basic controls.
public protocol PUXIBLocalizable {
    var xibLocKey: String? { get set }
}

/// Protocol to localize multiple texts in the same control.
public protocol PUXIBMultiLocalizable {
    var xibLocKeys: String? { get set }
}

/// Protocol to localize text field and text view placeholders.
public protocol PUXIBPlaceholderLocalizable {
    var xibPlaceholderLocKey: String? { get set }
}
