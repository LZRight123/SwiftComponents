//
//  StringExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 SwifterSwift
//

import Foundation
import SwifterSwift

public extension String {
    func format(_ f: String) -> String {
        return String(format: "%\(f)", self)
    }
    
    var numberFormat: String {
        let format = NumberFormatter()
        format.positiveFormat = "0.##;"
        format.roundingMode = .down
        return format.string(for: Decimal(string: self)) ?? ""
    }
    
    func formatCustom(_ positive: String, roundingMode: NumberFormatter.RoundingMode = .down) -> String {
        let format = NumberFormatter()
        format.positiveFormat = positive
        format.roundingMode = roundingMode
        return format.string(for:  Decimal(string:self)) ?? ""
    }
    
    func rangeOf(_ text: String) -> NSRange {
        return (self as NSString).range(of: text)
    }
    
    func boundingWidth(with font: UIFont) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: font.lineHeight)
        let preferredRect = (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(preferredRect.width)
    }
    
    func buildInsert(before: String, after: String, attributes: [NSAttributedString.Key : Any]) -> NSMutableAttributedString {
        let text = "\(before)\(self)\(after)"
        let attri =  NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.clear])
        attri.addAttributes(attributes, range: text.rangeOf(self))
        return attri
    }
    
    var toDouble: Double { self.double() ?? 0 }
}


public extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

public extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}

public extension String {
    static func + (lhs: String, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(string: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }
}
