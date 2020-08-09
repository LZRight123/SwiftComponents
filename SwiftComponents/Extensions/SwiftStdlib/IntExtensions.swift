//
//  IntExtensions.swift
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
public extension Int {
    
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
    
    
    var string: String {  String(self) }
}

// MARK: - Methods
public extension Int {
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
    
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
  
}
