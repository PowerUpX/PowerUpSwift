//
//  UITableView.swift
//  Pods-PowerUpSwift_Example
//
//  Created by Ceferino Jose II on 8/6/20.
//

import UIKit

extension UITableView {
    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}
