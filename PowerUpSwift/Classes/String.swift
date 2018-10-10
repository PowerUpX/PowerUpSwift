//
//  String.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension String {
    /// Replaces two or more spaces with a single space and removes all the spaces around the string.
    mutating public func sanitized() {
        self = self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Checks if the String is a valid email and returns a Bool.
    public var isValidEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// Checks if the String is an invalid email and returns a Bool.
    public var isNotValidEmail: Bool {
        return !self.isValidEmail
    }
    
    /// That String is used as the key to find the value from your Localizable resources and return the result.
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func limitLength(_ n: Int) -> String {
        if self.count <= n {
            return self
        }
        return String(Array(self).prefix(upTo: n))
    }
}
