//
//  PURepresentable.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/24/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

/// PowerUpSwift: A protocol that all the PowerUpSwift classes conform to such as `PUView`.
/// All these classes allow you to set additional UIKit properties via the Interface Builder.
public protocol PURepresentable {
    var cornerRadius: CGFloat { get set }
    var borderWidth: CGFloat { get set }
    var borderColor: UIColor? { get set }
    var shadowRadius: CGFloat { get set }
    var shadowOpacity: Float { get set }
    var shadowOffset: CGSize { get set }
    var shadowColor: UIColor? { get set }
}
