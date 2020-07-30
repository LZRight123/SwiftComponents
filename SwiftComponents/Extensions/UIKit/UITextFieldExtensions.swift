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

// MARK: - Enums
public extension UITextField {

    /// SwifterSwift: UITextField text type.
    ///
    /// - emailAddress: UITextField is used to enter email addresses.
    /// - password: UITextField is used to enter passwords.
    /// - generic: UITextField is used to enter generic text.
    enum TextType {
        /// UITextField is used to enter email addresses.
        case emailAddress

        /// UITextField is used to enter passwords.
        case password

        /// UITextField is used to enter generic text.
        case generic
    }

}

// MARK: - Properties
public extension UITextField {

    /// SwifterSwift: Set textField for common text types.
    var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"

            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"

            case .generic:
                isSecureTextEntry = false
            }
        }
    }

    /// SwifterSwift: Check if text field is empty.
    var isEmpty: Bool {
        return text?.isEmpty == true
    }

    /// SwifterSwift: Return text with no spaces or new lines in beginning and end.
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// SwifterSwift: Check if textFields text is a valid email format.
    ///
    ///		textField.text = "john@doe.com"
    ///		textField.hasValidEmail -> true
    ///
    ///		textField.text = "swifterswift"
    ///		textField.hasValidEmail -> false
    ///
    var hasValidEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }

    /// SwifterSwift: Left view tint color.
    @IBInspectable var leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }

    /// SwifterSwift: Right view tint color.
    @IBInspectable var rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
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
      
      @IBInspectable var leftImage: UIImage? {
          set {
              guard let image = newValue else {
                  return
              }
              addPaddingLeftIcon(image)
          }
          
          get {
              if let leftImgView = leftView as? UIImageView {
                  return leftImgView.image
              }
              return nil
          }
      }

}

// MARK: - Methods
public extension UITextField {

    /// SwifterSwift: Clear text.
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }

    /// SwifterSwift: Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }

    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
    func addPaddingLeft(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }

    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
    func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat = 0) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        leftView = imageView
        leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        leftViewMode = .always
    }

}

#endif
