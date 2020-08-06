//
//  String.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension String {
    /// Changes the current value (*mutating*) of the String by calling PowerUpSwift's `sanitize()`
    public mutating func sanitized() {
        self = self.sanitize()
    }
    
    /// Returns the trimmed valueof the String by:
    /// - removing all the white spaces and white new lines around
    /// - replacing two or more spaces inside with a single space
    /// - replacing three or more new lines inside with two new lines
    ///
    /// **It should just work! Trust PowerUpSwift. 😂😂😂**
    public func sanitize() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\\ \\ +", with: " ", options: .regularExpression)
            .replacingOccurrences(of: "\n\n\n+", with: "\n\n", options: .regularExpression)
    }
    
    /// Checks if the String is a valid email and returns a Bool.
    public var isValidEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// Reverses the value of `isValidEmail` so it feels more natural to write than using an exclamation point.
    public var isNotValidEmail: Bool {
        return !self.isValidEmail
    }
    
    /// Reverses the built-in `isEmpty` so it feels more natural to write than using an exclamation point.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// Uses the very `String` as the **key** to find the value from the Localizable resources and return the localized **value**.
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Checks if the String is a valid ip address and returns a Bool.
    public var isValidIP: Bool {
        let regEx = "^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// Reverses the value of `isValidIP` so it feels more natural to write than using an exclamation point.
    public var isNotValidIP: Bool {
        return !self.isValidIP
    }
    
    /// Checks if the String is a valid mac address and returns a Bool.
    public var isValidMAC: Bool {
        let regEx = "^([0-9A-Fa-f]{2}[:]){5}([0-9A-Fa-f]{2})$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    /// Reverses the value of `isValidMAC` so it feels more natural to write than using an exclamation point.
    public var isNotValidMAC: Bool {
        return !self.isValidMAC
    }
    
    /// Returns the `Dictionary` form of the `String` if the format is valid or `nil` if invalid.
    public var asJSON: [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                return nil
            }
        }
        
        return nil
    }
    
    /// Parses and returns the payload `Dictionary` if the string is a JWT.
    public var extractedJWTPayload: [String: Any]? {
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
    
    func limitLength(_ n: Int) -> String {
        if self.count <= n {
            return self
        }
        return String(Array(self).prefix(upTo: n))
    }
}

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
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
