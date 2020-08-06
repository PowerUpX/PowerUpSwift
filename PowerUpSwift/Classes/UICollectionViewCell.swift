//
//  UICollectionViewCell.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 4/16/20.
//

import UIKit

extension UICollectionViewCell {
    /// **PowerUpSwift**: Returns the reversed value of `isSelected`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotSelected: Bool {
        return !self.isSelected
    }
    
    /// **PowerUpSwift**: Returns the reversed value of `isHighlighted`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotHighlighted: Bool {
        return !self.isHighlighted
    }
}
