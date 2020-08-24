//
//  UITableView.swift
//  Pods-PowerUpSwift_Example
//
//  Created by Ceferino Jose II on 8/6/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UITableView {
    public func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}
