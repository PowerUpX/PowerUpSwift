//
//  Bool.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

extension Bool {
    public init(_ intValue: Int) {
        if intValue == 0 {
            self.init(false)
        } else {
            self.init(true)
        }
    }
}

