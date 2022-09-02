//
//  String.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension String {
    /// PowerUpSwift: A `mutating` counterpart of `santized()`.
    public mutating func sanitize() {
        self = self.sanitized()
    }
    
    /// PowerUpSwift: Returns the trimmed valueof the String by:
    /// - removing all the white spaces and white new lines around
    /// - replacing two or more spaces inside with a single space
    /// - replacing three or more new lines inside with two new lines
    ///
    /// **It should just work! Trust PowerUpSwift. 😂😂😂**
    public func sanitized() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\\ \\ +", with: " ", options: .regularExpression)
            .replacingOccurrences(of: "\n\n\n+", with: "\n\n", options: .regularExpression)
    }
    
    /// PowerUpSwift: Checks if the String is a valid email and returns a `Bool` value.
    public var isValidEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// PowerUpSwift: Returns the reversed value of `isValidEmail`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotValidEmail: Bool {
        return !self.isValidEmail
    }
    
    /// PowerUpSwift: Returns the reversed value of `isEmpty`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// PowerUpSwift: Uses the very `String` as the **key** in
    /// the main bundle's localizable resources and returns the **value**.
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// PowerUpSwift: Uses the very `String` as the **key** in the
    /// specified bundle's localizable resources and returns the **value**.
    public func localized(in bundle: Bundle?, comment: String = "") -> String {
        guard let bundle = bundle else {
            return NSLocalizedString(self, comment: comment)
        }
        
        return NSLocalizedString(self, bundle: bundle, comment: comment)
    }
    
    /// PowerUpSwift: Checks if the String is a valid IP address and returns a `Bool` value.
    public var isValidIP: Bool {
        let regEx = "^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// PowerUpSwift: Returns the reversed value of `isValidIP`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotValidIP: Bool {
        return !self.isValidIP
    }
    
    /// PowerUpSwift: Checks if the String is a valid mac address and returns a `Bool` value.
    public var isValidMAC: Bool {
        let regEx = "^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// PowerUpSwift: Returns the reversed value of `isValidMAC`
    /// so it feels more natural to write than using an exclamation point.
    public var isNotValidMAC: Bool {
        return !self.isValidMAC
    }
    
    /// PowerUpSwift: Returns the `Dictionary` form of the `String`
    /// if the format is valid or `nil` if invalid.
    public var json: [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                return nil
            }
        }
        
        return nil
    }
    
    /// PowerUpSwift: Parses the `String` and returns the payload `Dictionary` if it's a valid JWT.
    public var jwtPayload: [String: Any]? {
        // Seperate the strings by '.'
        let segments = self.components(separatedBy: ".")
        
        // Get the middle part of the jwt which is a base 64 version of the payload
        let base64Payload = segments[1]
        
        // I am not sure what's going on here but it works
        let padded = base64Payload.padding(
            toLength: ((base64Payload.count + 3) / 4) * 4,
            withPad: "=",
            startingAt: 0
        )
        
        // Decode the base 64 string to `Dictionary`
        if let decoded = Data(base64Encoded: padded),
            let json = try? JSONSerialization.jsonObject(with: decoded, options: []) as? [String: Any] {
            return json
        }
        
        return nil
    }
}

extension Optional where Wrapped == String {
    /// :nodoc:
    public var isNilOrEmpty: Bool {
        return (self ?? "").isEmpty
    }
}

// MARK: - Deprecated
extension String {
    // This is how we are going to deprecate things.
    // @available(*, deprecated, renamed: "sanitize", message: "This is effective starting in version x.x.x.")
    // @available(*, unavailable, renamed: "sanitize", message: "This will no longer work starting in version x.x.x.")
    // public func oldFunction() {
    //     self.newFunction()
    // }
}
