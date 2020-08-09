//
//  UILabelExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 9/23/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Methods
public extension UILabel {

    convenience init(font: UIFont = .font14, textColor: UIColor = .hex222222, text: String? = "", numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.text = text
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
    }


}

#endif
