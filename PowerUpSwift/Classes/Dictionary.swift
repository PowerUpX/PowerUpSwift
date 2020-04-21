//
//  Dictionary.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Dictionary {
    /// Returns a JSON `Data` converted from a `Dictionary`.
    public var data: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
