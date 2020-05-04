//
//  URLResponse.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Optional where Wrapped == URLResponse {
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
    
    public var isUnauthorized: Bool {
        if let response = self {
            return response.code == 401
        }
        
        return false
    }
}

extension URLResponse {
    public var code: Int {
        return (self as! HTTPURLResponse).statusCode
    }
}
