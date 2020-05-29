//
//  PowerUpTextView.swift
//  PowerUpSwift
//
//  Created by Ceferino Jose II on 10/11/18.
//

import UIKit

@IBDesignable
open class PowerUpTextView: UITextView {
    var placeholderLabel = PowerUpLabel()
    
    /// The custom-built placeholder for UITextViews through the PowerUpTextView subclass.
    @IBInspectable open var placeholder: String? = nil {
        didSet {
            self.placeholderLabel.text = placeholder
        }
    }
    
    /// The custom-built placeholder color for UITextViews through the PowerUpTextView subclass.
    @IBInspectable open var placeholderColor: UIColor = UIColor(r: 255, g: 255, b: 255, a: 0.25) {
        didSet {
            self.placeholderLabel.textColor = placeholderColor
        }
    }
    
    /// The user-defined minimum height.
    @IBInspectable open var minExpandableHeight: CGFloat = 30
    
    /// The user-defined maximum height. Once it is reached, the text view becomes scrollable.
    @IBInspectable open var maxExpandableHeight: CGFloat = 30
    
    @IBInspectable open var topInset: CGFloat = 0 {
        didSet {
            self.textContainerInset = UIEdgeInsets(
                top: topInset,
                left: self.textContainerInset.left,
                bottom: self.textContainerInset.bottom,
                right: self.textContainerInset.right
            )
            self.placeholderLabel.topInset = topInset
        }
    }
    
    @IBInspectable open var leftInset: CGFloat = 0 {
        didSet {
            self.textContainerInset = UIEdgeInsets(
                top: self.textContainerInset.top,
                left: self.leftInset,
                bottom: self.textContainerInset.bottom,
                right: self.textContainerInset.right
            )
            self.placeholderLabel.leftInset = leftInset + 4
        }
    }
    
    @IBInspectable open var bottomInset: CGFloat = 0 {
        didSet {
            self.textContainerInset = UIEdgeInsets(
                top: self.textContainerInset.top,
                left: self.textContainerInset.left,
                bottom: self.bottomInset,
                right: self.textContainerInset.right
            )
            self.placeholderLabel.bottomInset = bottomInset
        }
    }
    
    @IBInspectable open var rightInset: CGFloat = 0 {
        didSet {
            self.textContainerInset = UIEdgeInsets(
                top: self.textContainerInset.top,
                left: self.textContainerInset.left,
                bottom: self.textContainerInset.bottom,
                right: self.rightInset
            )
            self.placeholderLabel.rightInset = rightInset + 4
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        commonInit()
    }
    
    private func commonInit() {
        // Add some custom dynamic padding
        self.textContainerInset = UIEdgeInsets(top: self.topInset, left: self.leftInset, bottom: self.bottomInset, right: self.rightInset)
        self.placeholderLabel.insets = self.textContainerInset
        
        // Set the properties of the placeholder label to make it look like the text view's text
        self.placeholderLabel.font = self.font
        self.placeholderLabel.textAlignment = self.textAlignment
        self.placeholderLabel.text = self.placeholder
        self.placeholderLabel.textColor = self.placeholderColor
        self.placeholderLabel.numberOfLines = 1
        self.placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.placeholderLabel)
        
        if #available(iOS 9.0, *) {
            self.placeholderLabel.topAnchor.constraint(equalTo: self.textInputView.topAnchor, constant: self.topInset).isActive = true
            self.placeholderLabel.leadingAnchor.constraint(equalTo: self.textInputView.leadingAnchor, constant: self.leftInset).isActive = true
            self.placeholderLabel.bottomAnchor.constraint(equalTo: self.textInputView.bottomAnchor, constant: self.bottomInset).isActive = true
            self.placeholderLabel.trailingAnchor.constraint(equalTo: self.textInputView.trailingAnchor, constant: self.rightInset).isActive = true
        }
        
        self.placeholderLabel.sizeToFit()
    }

    /**
     Calculates the new height of the text view based on the size of the content
     and the user-defined `maxExpandableHeight`.
     You should reference an `@IBOutlet` to the height constraint.
     Make sure the PowerUpTextView's delegate is also set through the Storyboard or via code.
     ### Example
     ```
     @IBOutlet powerUpTextViewHeightConstraint: NSLayoutConstraint!
     
     func textViewDidChange(_ textView: UITextView) {
        self.powerUpTextViewHeightConstraint.constant = self.powerUpTextView.newExpandableHeight
     }
     ```
    */
    open var newExpandableHeight: CGFloat {
        // Make the textview's height dynamic while typing (Hacky iOS sucks)
        let size = CGSize(width: self.frame.width, height: .infinity)
        let estimatedSize = self.sizeThatFits(size)
        var height: CGFloat {
            if estimatedSize.height > self.minExpandableHeight && estimatedSize.height <= self.maxExpandableHeight {
                self.isScrollEnabled = false
                return estimatedSize.height
            } else if estimatedSize.height > self.maxExpandableHeight {
                self.isScrollEnabled = true
                self.scrollToBottom()
                return self.maxExpandableHeight
            } else {
                self.isScrollEnabled = false
                return self.minExpandableHeight
            }
        }
        return height
    }
    
    /**
     Toggles the visibility of the text view's placeholder.
     ### Example
     ```
     func textViewDidChange(_ textView: UITextView) {
        self.powerUpTextView.refreshPlaceholder()
     }
     ```
     */
    open func refreshPlaceholder() {
        self.placeholderLabel.isHidden = !self.text!.isEmpty
    }
    
    /// Clears the text view and sets the placeholder to visible.
    open func clear() {
        self.text = nil
        self.placeholderLabel.isHidden = false
    }
    
    // MARK: - View
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet { self.layer.cornerRadius = self.cornerRadius }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet { self.layer.borderWidth = self.borderWidth }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        didSet { self.layer.borderColor = self.borderColor?.cgColor }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet { self.layer.shadowRadius = self.shadowRadius }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet { self.layer.shadowOpacity = self.shadowOpacity }
    }
    
    @IBInspectable open var shadowOffset: CGSize = .zero {
        didSet { self.layer.shadowOffset = self.shadowOffset }
    }
    
    @IBInspectable open var shadowColor: UIColor? {
        didSet { self.layer.shadowColor = self.borderColor?.cgColor }
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                self.layer.borderColor = self.borderColor?.cgColor
                self.layer.shadowColor = self.borderColor?.cgColor
            }
        }
    }
}

