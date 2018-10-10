//
//  String.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import Foundation

extension String {
    public var isValidEmail: Bool {
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
    
    public var isNotValidEmail: Bool {
        return !self.isValidEmail
    }
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
