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
    ///use: let btn = UIButton(font: .font13, title: "", titleColor: .hex181818, image: nil)
    convenience init(font: UIFont = .font13, title: String = "", titleColor: UIColor = .black, image: UIImage? = nil) {
        self.init()
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
    }
    
}



#endif
