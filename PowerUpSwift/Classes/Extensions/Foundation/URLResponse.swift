//
//  URLResponse.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension Optional where Wrapped == URLResponse {
    /// PowerUpSwift: Returns `true` if the HTTP Status Code is between the range of 200 to 299.
    public var isSuccess: Bool {
        if let response = self {
            switch response.code {
            case 200...299:
                return true
            default:
                return false
            }
        }
        
        return false
    }
    
    /// PowerUpSwift: Returns `true` if the HTTP Status Code is 401.
    public var isUnauthorized: Bool {
        if let response = self {
            return response.code == 401
        }
        
        return false
    }
    
    /// PowerUpSwift: Returns `true` if the HTTP Status Code is 403.
    public var isForbidden: Bool {
        if let response = self {
            return response.code == 403
        }
        
        return false
    }
}

extension URLResponse {
    /// PowerUpSwift: Returns the HTTP Status Code.
    public var code: Int {
        return (self as! HTTPURLResponse).statusCode
    }
}
