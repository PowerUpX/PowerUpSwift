//
//  UICollectionViewCell.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 4/16/20.
//

import UIKit

extension UICollectionViewCell {
    /// Reverses the built-in `isSelected` so it feels more natural to write than using an exclamation point.
    public var isNotSelected: Bool {
        return !self.isSelected
    }
    
    /// Reverses the built-in `isHighlighted` so it feels more natural to write than using an exclamation point.
    public var isNotHighlighted: Bool {
        return !self.isHighlighted
    }
}
