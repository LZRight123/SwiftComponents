//
//  UITextFieldExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Initializers
extension UITextField {
    convenience init(font: UIFont, textColor: UIColor, placeholder: String? = nil, keyboardType: UIKeyboardType = .default, textAlignment: NSTextAlignment = .left, adjustsFontSizeToFitWidth: Bool = true) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.textAlignment = textAlignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
    }
}

// MARK: - Properties
public extension UITextField {
    @objc @IBInspectable var aplaceholderColor: UIColor? {
          get {
              return nil
          }
          set {
              guard let color = newValue else { return }
              
              if let attributedPlaceholder = attributedPlaceholder {
                  let text = NSMutableAttributedString(attributedString: attributedPlaceholder)
                  text.addAttributes([.foregroundColor : color], range: NSRange(location: 0, length: attributedPlaceholder.string.count))
                  self.attributedPlaceholder = text
              }
              
              guard let placeholder = placeholder else { return }
              
              let text = NSAttributedString(string: placeholder, attributes: [
                  .foregroundColor : color
                  ])
              attributedPlaceholder = text
          }
      }
   

}


#endif
