//
//  UITextView.swift
//  Pods
//
//  Created by Ceferino Jose II on 10/15/18.
//

import UIKit

extension UITextView {
    public func scrollToBottom() {
        if self.text.count > 0 {
            let location = self.text.count - 1
            let bottom = NSMakeRange(location, 1)
            self.scrollRangeToVisible(bottom)
        }
    }
}
