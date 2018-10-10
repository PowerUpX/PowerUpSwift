//
//  URLRequest.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

public enum HTTPMethod: String {
    case post = "POST", put = "PUT", delete = "DELETE", get = "GET"
}

extension URLRequest {
    mutating public func setMethod(_ method: HTTPMethod) {
        self.httpMethod = method.rawValue
    }
    
    mutating public func setBody(_ json: [String: Any]) {
        self.httpBody = json.data
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
