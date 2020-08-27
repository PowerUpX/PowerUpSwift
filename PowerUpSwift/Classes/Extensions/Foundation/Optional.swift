//
//  Optional.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension Optional {
    /// :nodoc:
    public var stringValue : String? {
        if self == nil { return nil }
        
        if self is String || self is String? {
            return self as? String
        }
        
        return nil
    }
    
    /// :nodoc:
    public var boolValue: Bool {
        if self == nil { return false }
        
        if self is String || self is String? {
            return Bool(self as! String) ?? false
        }
        
        return false
    }
    
    /// :nodoc:
    public var dictionaryValue: [String: Any] {
        return self as? [String: Any] ?? [:]
    }
    
    /// :nodoc:
    public var dictionaryArrayValue: [[String: Any]] {
        return self as? [[String: Any]] ?? []
    }
    
    /// :nodoc:
    public var intValue: Int? {
        return self as? Int
    }
    
    /// :nodoc:
    public var doubleValue: Double? {
        return self as? Double
    }
    
    /// :nodoc:
    public var floatValue: Float? {
        return self as? Float
    }
    
    /// :nodoc:
    public var urlValue: URL? {
        if self == nil { return nil }
        
        if self is String || self is String? {
            return URL(string: (self as? String) ?? "")
        }
        
        if self is URL || self is URL? {
            return self as? URL
        }
        
        return nil
    }
}

