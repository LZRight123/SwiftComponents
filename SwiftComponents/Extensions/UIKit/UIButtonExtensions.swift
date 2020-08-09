//
//  UIButtonExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/22/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Initializers
public extension UIButton {
    convenience init(font: UIFont = .font13, title: String = "", titleColor: UIColor = .black, image: UIImage? = nil) {
        self.init()
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
    }
    
}



#endif
