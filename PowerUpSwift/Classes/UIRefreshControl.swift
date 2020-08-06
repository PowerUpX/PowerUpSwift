//
//  UIRefreshControl.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//

import UIKit

extension UIRefreshControl {
    /// Reverses the value of `isRefreshing` so it feels more natural to write than using an exclamation point.
    public var isNotRefreshing: Bool {
        return !self.isRefreshing
    }
}
