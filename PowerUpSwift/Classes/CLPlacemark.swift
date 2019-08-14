//
//  CLPlacemark.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 14/08/2019.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    public var asFullAddress: String? {
        // See: https://stackoverflow.com/a/7768890
        var address = ""
        
        if let subThouroughfare = self.subThoroughfare { address += subThouroughfare + ", " }
        if let thoroughfare = self.thoroughfare { address += thoroughfare + ", " }
        if let subLocality = self.subLocality { address += subLocality + ", " }
        if let locality = self.locality { address += locality + ", " }
        if let subAdministrativeArea = self.subAdministrativeArea { address += subAdministrativeArea + ", " }
        if let administrativeArea = self.administrativeArea { address += administrativeArea + ", " }
        if let postalCode = self.postalCode { address += postalCode + ", " }
        if let country = self.country { address += country }
        
        guard address.isNotEmpty else { return nil }
        
        return address
    }
}
