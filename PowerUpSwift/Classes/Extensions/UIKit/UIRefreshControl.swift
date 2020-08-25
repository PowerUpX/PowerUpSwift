//
//  UIRefreshControl.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    /// PowerUpSwift: Returns the reversed value of `isRefreshing`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotRefreshing: Bool {
        return !self.isRefreshing
    }
}
