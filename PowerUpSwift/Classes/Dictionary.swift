//
//  Dictionary.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Dictionary {
    public var data: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}
