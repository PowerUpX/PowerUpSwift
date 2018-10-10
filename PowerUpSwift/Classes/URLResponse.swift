//
//  URLResponse.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Optional where Wrapped == URLResponse? {
    public var isSuccess: Bool {
        if let response = self as? URLResponse, response.code >= 200 && response.code < 300 {
            return true
        }
        
        return false
    }
}

extension URLResponse {
    public var code: Int {
        return (self as! HTTPURLResponse).statusCode
    }
}

