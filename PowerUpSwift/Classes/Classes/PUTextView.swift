//
//  PUTextView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/11/18.
//  Copyright © 2020 PowerUpX. All rights reserved.
//

import UIKit

/// PowerUpSwift: The subclass of `UITextView` that allows the editing of additional UIKit properties via the Interface Builder.
@IBDesignable open class PUTextView: UITextView, PUXIBPlaceholderLocalizable, PUInspectable {
    var placeholderLabel = PULabel()
    
    // MARK: - Inspectables
    @IBInspectable open var xibPlaceholderLocKey: String? {
        didSet { placeholder = xibPlaceholderLocKey?.localized }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        didSet { layer.borderColor = borderColor?.cgColor }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet { layer.shadowRadius = shadowRadius }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet { layer.shadowOpacity = shadowOpacity }
    }
    
    @IBInspectable open var shadowOffset: CGSize = .zero {
        didSet { layer.shadowOffset = shadowOffset }
    }
    
    @IBInspectable open var shadowColor: UIColor? {
        didSet { layer.shadowColor = shadowColor?.cgColor }
    }
    
    /// PowerUpSwift: The custom-built placeholder since Apple does not provide a `placeholder` for `UITextView`.
    @IBInspectable open var placeholder: String? = nil {
        didSet { placeholderLabel.text = placeholder }
    }
    
    /// PowerUpSwift: The text color of the custom-built placeholder.
    /// Defaults `UIColor(r: 255, g: 255, b: 255, a: 0.25)`.
    @IBInspectable open var placeholderColor: UIColor = UIColor(r: 255, g: 255, b: 255, a: 0.25) {
        didSet { placeholderLabel.textColor = placeholderColor }
    }
    
    /// PowerUpSwift: The user-defined minimum height. Defaults to 30.
    @IBInspectable open var minExpandableHeight: CGFloat = 30
    
    /// PowerUpSwift: The user-defined maximum height. Once reached, the text view becomes scrollable.
    /// Defaults to 30.
    @IBInspectable open var maxExpandableHeight: CGFloat = 30
    
    /// PowerUpSwift: The top padding. Defaults to 0.
    @IBInspectable open var topInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(
                top: topInset,
                left: textContainerInset.left,
                bottom: textContainerInset.bottom,
                right: textContainerInset.right
            )
            placeholderLabel.topInset = topInset
        }
    }
    
    /// PowerUpSwift: The left padding. Defaults to 0.
    @IBInspectable open var leftInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(
                top: textContainerInset.top,
                left: leftInset,
                bottom: textContainerInset.bottom,
                right: textContainerInset.right
            )
            placeholderLabel.leftInset = leftInset + 4
        }
    }
    
    /// PowerUpSwift: The bottom padding. Defaults to 0.
    @IBInspectable open var bottomInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(
                top: textContainerInset.top,
                left: textContainerInset.left,
                bottom: bottomInset,
                right: textContainerInset.right
            )
            placeholderLabel.bottomInset = bottomInset
        }
    }
    
    /// PowerUpSwift: The right padding. Defaults to 0.
    @IBInspectable open var rightInset: CGFloat = 0 {
        didSet {
            textContainerInset = UIEdgeInsets(
                top: textContainerInset.top,
                left: textContainerInset.left,
                bottom: textContainerInset.bottom,
                right: rightInset
            )
            placeholderLabel.rightInset = rightInset + 4
        }
    }
    
    /// :nodoc:
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    /// :nodoc:
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        commonInit()
    }
    
    private func commonInit() {
        // Add some custom dynamic padding
        textContainerInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        placeholderLabel.insets = textContainerInset
        
        // Set the properties of the placeholder label to make it look like the text view's text
        placeholderLabel.font = font
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.numberOfLines = 1
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(placeholderLabel)
        
        if #available(iOS 9.0, *) {
            placeholderLabel.topAnchor.constraint(equalTo: textInputView.topAnchor, constant: topInset).isActive = true
            placeholderLabel.leadingAnchor.constraint(equalTo: textInputView.leadingAnchor, constant: leftInset).isActive = true
            placeholderLabel.bottomAnchor.constraint(equalTo: textInputView.bottomAnchor, constant: bottomInset).isActive = true
            placeholderLabel.trailingAnchor.constraint(equalTo: textInputView.trailingAnchor, constant: rightInset).isActive = true
        }
        
        placeholderLabel.sizeToFit()
    }

    // MARK: - Properties
    /**
     PowerUpSwift: Calculates the new height of the text view based on the size of the content and the user-defined `maxExpandableHeight`.
     You should reference an `@IBOutlet` to the height constraint.
     Make sure the `PUTextView`'s delegate is also set via the Interface Builder or via code.
     ### Example
     ```swift
     @IBOutlet powerUpTextView: PowerUpTextView!
     @IBOutlet powerUpTextViewHeightConstraint: NSLayoutConstraint!
     
     func textViewDidChange(_ textView: UITextView) {
         powerUpTextViewHeightConstraint.constant = powerUpTextView.newExpandableHeight
     }
     ```
     */
    open var newExpandableHeight: CGFloat {
        // Make the textview's height dynamic while typing (Hacky iOS sucks)
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = sizeThatFits(size)
        var height: CGFloat {
            if estimatedSize.height > minExpandableHeight && estimatedSize.height <= maxExpandableHeight {
                isScrollEnabled = false
                return estimatedSize.height
            } else if estimatedSize.height > maxExpandableHeight {
                isScrollEnabled = true
                scrollToBottom()
                return maxExpandableHeight
            } else {
                isScrollEnabled = false
                return minExpandableHeight
            }
        }
        return height
    }
}

// MARK: - Custom Functions
extension PUTextView {
    /**
     PowerUpSwift: Toggles the visibility of the text view's placeholder.
     ### Example
     ```swift
     func textViewDidChange(_ textView: UITextView) {
         powerUpTextView.refreshPlaceholder()
     }
     ```
     */
    open func refreshPlaceholder() { placeholderLabel.isHidden = !text!.isEmpty }
    
    /// PowerUpSwift: Clears the text view and sets the placeholder to visible.
    open func clear() {
        text = nil
        placeholderLabel.isHidden = false
    }
}

extension PUTextView {
    /// :nodoc:
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Handle the color update when switching to or from dark mode
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                layer.setNeedsDisplay()
            }
        }
    }
}

