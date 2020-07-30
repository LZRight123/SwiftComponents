//
//  DoubleExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if os(macOS) || os(iOS)
import Darwin
#elseif os(Linux)
import Glibc
#endif
import Foundation

// MARK: - Properties
public extension Double {

    /// SwifterSwift: Int.
    var int: Int {
        if self >= Int.max.toDouble {
            return Int.max
        }
        return Int(self)
    }

    /// SwifterSwift: Float.
    var float: Float {
        return Float(self)
    }

    #if canImport(CoreGraphics)
    /// SwifterSwift: CGFloat.
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    #endif
    
    var toString: String { return String(self) }
    var toInt: Int { return Int(self) }
    var toCGFloat: CGFloat { return CGFloat(self) }
}

//MARK: - Methods
public extension Double {
    func format(_ f: String) -> String {
        return String(format: "%\(f)", self)
    }
    
    var numberFormat: String {
        let format = NumberFormatter()
        format.positiveFormat = "0.##;"
        format.roundingMode = .down
        return format.string(for: self) ?? ""
    }
    
    func formatCustom(_ positive: String, roundingMode: NumberFormatter.RoundingMode = .down) -> String {
        let format = NumberFormatter()
        format.positiveFormat = positive
        format.roundingMode = roundingMode
        return format.string(for: self) ?? ""
    }
}

// MARK: - Operators

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence
/// SwifterSwift: Value of exponentiation.
///
/// - Parameters:
///   - lhs: base double.
///   - rhs: exponent double.
/// - Returns: exponentiation result (example: 4.4 ** 0.5 = 2.0976176963).
func ** (lhs: Double, rhs: Double) -> Double {
    // http://nshipster.com/swift-operators/
    return pow(lhs, rhs)
}

// swiftlint:disable identifier_name
prefix operator √
/// SwifterSwift: Square root of double.
///
/// - Parameter double: double value to find square root for.
/// - Returns: square root of given double.
public prefix func √ (double: Double) -> Double {
    // http://nshipster.com/swift-operators/
    return sqrt(double)
}
// swiftlint:enable identifier_name
