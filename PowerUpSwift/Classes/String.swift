//
//  String.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension String {
    /// Changes the current value (*mutating*) of the String by:
    /// - removing all the white spaces and white new lines around
    /// - replacing two or more spaces inside with a single space
    /// - replacing three or more new lines inside with two new lines
    ///
    /// **It should just work! Trust PowerUpSwift. 😂😂😂**
    mutating public func sanitize() {
        self = self.trimmingCharacters(in: .whitespacesAndNewlines)
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
    
    func limitLength(_ n: Int) -> String {
        if self.count <= n {
            return self
        }
        return String(Array(self).prefix(upTo: n))
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
