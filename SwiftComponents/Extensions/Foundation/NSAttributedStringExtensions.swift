//
//  NSAttributedStringExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 26/11/2016.
//  Copyright © 2016 SwifterSwift
//

#if canImport(Foundation)
import Foundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(Cocoa)
import Cocoa
#endif


//MARK: -
public extension NSAttributedString {
    static func build(fullText full: String, subText sub: String, fullAttri: [NSAttributedString.Key : Any]? = nil, subAttri: [NSAttributedString.Key : Any]) -> NSMutableAttributedString {
        let attri = NSMutableAttributedString(string: full, attributes: fullAttri)
        attri.addAttributes(subAttri, range: full.rangeOf(sub))
        return attri
    }
    
    func font(with font: UIFont) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        copy.addAttributes([.font: font], range: range)
        return copy
    }
}

#endif
