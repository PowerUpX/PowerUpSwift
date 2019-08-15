//
//  Bundle.swift
//  Pods-PowerUpSwift_Example
//
//  Created by Ceferino Jose II on 15/08/2019.
//

import Foundation

extension Bundle {
    public static var versionNumber: String? {
        return main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public static var buildNumber: String? {
        return main.infoDictionary?["CFBundleVersion"] as? String
    }
}
