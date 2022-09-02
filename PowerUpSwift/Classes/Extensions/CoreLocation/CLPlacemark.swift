//
//  CLPlacemark.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 14/08/2019.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    /// PowerUpSwift: Returns a `String` that is composed of the concatenation of
    /// the properties of the CLPlacemark instance to form a full address format.
    public var fullAddress: String? {
        // See: https://stackoverflow.com/a/7768890
        var address = ""
        
        if let subThouroughfare = subThoroughfare { address += subThouroughfare + ", " }
        if let thoroughfare = thoroughfare { address += thoroughfare + ", " }
        if let subLocality = subLocality { address += subLocality + ", " }
        if let locality = locality { address += locality + ", " }
        if let subAdministrativeArea = subAdministrativeArea { address += subAdministrativeArea + ", " }
        if let administrativeArea = administrativeArea { address += administrativeArea + ", " }
        if let postalCode = postalCode { address += postalCode + ", " }
        if let country = country { address += country }
        
        guard address.isNotEmpty else { return nil }
        
        return address
    }
}
