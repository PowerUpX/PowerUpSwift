//
//  URLRequest.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

/// PowerUpSwift: An enum that mirrors the `String` values of the HTTP methods to prevent the risk of typographical errors.
/// - Source: [https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
public enum HTTPMethod: String {
    /// PowerUpSwift: Requests a representation of the specified resource.
    /// This should only retrieve data.
    case get = "GET"
    
    /// PowerUpSwift: Asks for a response identical to that of a GET request,
    /// but without the response body.
    case head = "HEAD"
    
    /// PowerUpSwift: Used to submit an entity to the specified resource,
    /// often causing a change in state or side effects on the server.
    case post = "POST"
    
    /// PowerUpSwift: Replaces all current representations of the target resource with the request payload.
    case put = "PUT"
    
    /// PowerUpSwift: Deletes the specified resource.
    case delete = "DELETE"
    
    /// PowerUpSwift: Establishes a tunnel to the server identified by the target resource.
    case connect = "CONNECT"
    
    /// PowerUpSwift: Used to describe the communication options for the target resource.
    case options = "OPTIONS"
    
    /// PowerUpSwift: Performs a message loop-back test along the path to the target resource.
    case trace = "TRACE"
    
    /// PowerUpSwift: Used to apply partial modifications to a resource.
    case patch = "PATCH"
}

extension URLRequest {
    /// PowerUpSwift: Sets the HTTP method using PowerUpSwift's `HTTPMethod` enum
    /// to help developer avoid mispelled Strings.
    public mutating func setMethod(_ method: HTTPMethod) {
        self.httpMethod = method.rawValue
    }
    
    /// PowerUpSwift: Sets the HTTP body by accepting a `Dictionary`
    /// that is converted to a `Data` behind the scenes.
    public mutating func setBody(_ json: [String: Any]) {
        self.httpBody = json.data
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    /// PowerUpSwift: Sets the HTTP body by accepting an object which has a Type that conforms to `Encodable`.
    public mutating func setBody<E: Encodable>(encodable: E) throws {
        self.httpBody = try JSONEncoder().encode(encodable)
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    /// PowerUpSwift: A syntatic sugar to set all the HTTP Headers at once.
    public mutating func setHeaders(_ headers: [String: String]) {
        self.allHTTPHeaderFields = headers
    }
    
    /// PowerUpSwift: A syntactic sugar to set the header fields intuitively.
    /// - Parameters:
    ///     - key: String
    ///     - value: String
    public mutating func addHeader(_ key: String, _ value: String) {
        self.addValue(value, forHTTPHeaderField: key)
    }
}
