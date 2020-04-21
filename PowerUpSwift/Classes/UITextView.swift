//
//  UITextView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/15/18.
//

import UIKit

extension UITextView {
    /// Makes the text views trailing content visible by scrolling to the bottom.
    public func scrollToBottom() {
        if self.text.count > 0 {
            let location = self.text.count - 1
            let bottom = NSMakeRange(location, 1)
            self.scrollRangeToVisible(bottom)
        }
    }
}
