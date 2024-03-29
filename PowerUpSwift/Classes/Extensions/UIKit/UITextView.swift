//
//  UITextView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/15/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

extension UITextView {
    /// PowerUpSwift: Makes the text views trailing content visible by scrolling to the bottom.
    public func scrollToBottom() {
        if text.count > 0 {
            let location = text.count - 1
            let bottom = NSMakeRange(location, 1)
            scrollRangeToVisible(bottom)
        }
    }
}
