//
//  URL.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension URL {
    /// PowerUpSwift: Adds query parameters and set the value to itself. Thus, `mutating`.
    public mutating func addQueryParams(_ queryParams: [String: Any]) {
        self = self.addingQueryParams(queryParams)
    }
    
    /// PowerUpSwift: Returns the URL object with the appended query parameters.
    public func addingQueryParams(_ queryParams: [String: Any]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        // Start putting together the paths:
        for param in queryParams {
            // If the query items is nil, we need to initialize so we can actually add the items.
            if components?.queryItems == nil {
                components?.queryItems = []
            }
            let queryItem = URLQueryItem(name: param.key, value: String(describing: param.value))
            components?.queryItems?.append(queryItem)
        }
        
        if let url = components?.url  {
            return url
        }
        
        return self
    }
}
