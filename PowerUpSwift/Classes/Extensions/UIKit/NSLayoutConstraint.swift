//
//  NSLayoutConstraint.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/18/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    /**
     PowerUpSwift A hack that returns a new constraint based on the passed in **multiplier**
     because the mutliplier property read-only.
     ### Example
     ````
     self.myConstraint = self.myConstraint.withMultiplier(1.75)
     ````
     - Parameter multiplier: The new value of the multiplier.
     - Returns: The new constraint.
     */
    public func withMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
