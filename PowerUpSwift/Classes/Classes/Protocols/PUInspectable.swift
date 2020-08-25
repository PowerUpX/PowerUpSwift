//
//  PUInspectable.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 8/24/20.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import Foundation

/// PowerUpSwift: A protocol that the majority of the PowerUpSwift classes conform to such as `PUView`.
/// All these classes allow the editing of additional UIKit properties via the Interface Builder.
public protocol PUInspectable {
    // MARK: - Inspectables
    /// PowerUpSwift: Makes the corner radius editable via the Interface Builder.
    var cornerRadius: CGFloat { get set }
    
    /// PowerUpSwift: Makes the width of the border editable via the Interface Builder.
    var borderWidth: CGFloat { get set }
    
    /// PowerUpSwift: Makes the color of the border editable via the Interface Builder.
    var borderColor: UIColor? { get set }
    
    /// PowerUpSwift: Makes the raidus of the shadow editable via the Interface Builder.
    var shadowRadius: CGFloat { get set }
    
    /// PowerUpSwift: Makes the opacity of the shadow editable via the Interface Builder.
    var shadowOpacity: Float { get set }
    
    /// PowerUpSwift: Makes the offset of the shadow editable via the Interface Builder.
    var shadowOffset: CGSize { get set }
    
    /// PowerUpSwift: Makes the color of the shadow editable via the Interface Builder.
    var shadowColor: UIColor? { get set }
}
