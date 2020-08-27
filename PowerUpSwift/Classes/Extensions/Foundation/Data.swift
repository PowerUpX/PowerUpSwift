//
//  Data.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 4/21/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension Data {
    /// PowerUpSwift: Returns the `Dictionary` form of the `Data` if the format is valid or `nil` if invalid.
    public var json: [String: Any]? {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] {
            return json
        }
        
        return nil
    }
}
