//
//  Bundle.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 15/08/2019.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

extension Bundle {
    public static var appName: String? {
        return self.main.infoDictionary?["CFBundleName"] as? String
    }
    
    public static var versionNumber: String? {
        return self.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public static var buildNumber: String? {
        return self.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
