//
//  URLRequest.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

// Source: https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods
public enum HTTPMethod: String {
    /// Requests a representation of the specified resource.
    /// This should only retrieve data.
    case get = "GET"
    
    /// Asks for a response identical to that of a GET request,
    /// but without the response body.
    case head = "HEAD"
    
    /// Used to submit an entity to the specified resource,
    /// often causing a change in state or side effects on the server.
    case post = "POST"
    
    /// Replaces all current representations of the target resource with the request payload.
    case put = "PUT"
    
    /// Deletes the specified resource.
    case delete = "DELETE"
    
    /// Establishes a tunnel to the server identified by the target resource.
    case connect = "CONNECT"
    
    /// Used to describe the communication options for the target resource.
    case options = "OPTIONS"
    
    /// Performs a message loop-back test along the path to the target resource.
    case trace = "TRACE"
    
    /// Used to apply partial modifications to a resource.
    case patch = "PATCH"
}

extension URLRequest {
    /// Sets the HTTP method using PowerUpSwift's `HTTPMethod` enum
    /// to help developer avoid mispelled Strings.
    mutating public func setMethod(_ method: HTTPMethod) {
        self.httpMethod = method.rawValue
    }
    
    /// Sets the HTTP body by accepting a `Dictionary`
    /// that is converted to a `Data` behind the scenes.
    mutating public func setBody(_ json: [String: Any]) {
        self.httpBody = json.data
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    mutating public func setHeaders(_ headers: [String: String]) {
        self.allHTTPHeaderFields = headers
    }
    
    /// A syntactic sugar to set the header fields.
    /// - Parameters:
    ///     - key: String
    ///     - value: String
    mutating public func addHeader(_ key: String, _ value: String) {
        self.addValue(value, forHTTPHeaderField: key)
    }
}
