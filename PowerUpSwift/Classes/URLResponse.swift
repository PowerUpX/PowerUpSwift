//
//  URLResponse.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Optional where Wrapped == URLResponse {
    public var isSuccess: Bool {
        if self == nil {
            return false
        }
        
        switch self!.code {
        case 200...299:
            return true
        default:
            return false
        }
    }
}

extension URLResponse {
    public var code: Int {
        return (self as! HTTPURLResponse).statusCode
    }
}
