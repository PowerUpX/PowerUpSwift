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
     PowerUpSwift Returns a new constraint based on the passed in **multiplier**
     because the mutliplier property is read-only.
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
            item: self.firstItem as Any,
            attribute: self.firstAttribute,
            relatedBy: self.relation,
            toItem: self.secondItem,
            attribute: self.secondAttribute,
            multiplier: multiplier,
            constant: self.constant
        )
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
