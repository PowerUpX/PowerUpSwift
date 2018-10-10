//
//  Optional.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension Optional {
    public var stringValue : String? {
        if self == nil { return nil }
        
        if self is String || self is String? {
            return self as? String
        }
        
        return nil
    }
    
    public var boolValue: Bool {
        if self == nil { return false }
        
        if self is String || self is String? {
            return Bool(self as! String) ?? false
        }
        
        if self is Int || self is Int? {
            return Bool(self as! Int)
        }
        
        return false
    }
    
    public var dictionaryValue: [String: Any] {
        return self as? [String: Any] ?? [:]
    }
    
    public var dictionaryArrayValue: [[String: Any]] {
        return self as? [[String: Any]] ?? []
    }
    
    public var intValue: Int? {
        return self as? Int
    }
    
    public var doubleValue: Double? {
        return self as? Double
    }
    
    public var floatValue: Float? {
        return self as? Float
    }
    
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

