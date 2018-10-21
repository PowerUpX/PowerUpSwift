//
//  UIColor.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/10/18.
//

import UIKit

extension UIColor {
    /// Initializes a UIColor based from the hex value.
    /// - Parameter hex: The hex string value similar to HTML.
    /// ### Example
    /// ```
    /// UIColor(hex: "#FFFFFF")
    /// ```
    convenience public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    /// Initializes a UIColor based from the rgb/a value similar to HTML.
    /// - Parameters:
    ///     - r: Red
    ///     - g: Green
    ///     - b: Blue
    ///     - a: Alpha that defaults to `1.0` if not provided.
    /// ### Example
    /// ```
    /// UIColor(r: 255, g: 255, b: 255)
    /// UIColor(r: 0, g: 0, b: 0, a: 0.5)
    /// ```
    convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = 1.0) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a!)
    }
}
