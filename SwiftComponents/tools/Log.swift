//
//  Log.swift
//  dsx
//
//  Created by liangze on 2020/4/30.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    case low = 100
    case normal = 400
    /// 高
    case high = 700
    /// 必须得有
    case mustBe = 1000
    
    public static var `default`: LogLevel  { .low }
}

public struct LogLevelMangager {
    
    public static var `default`: LogLevel = .default
}

private func lzprint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    lzprint(items, separator: separator, terminator: terminator, level: .default)
    #endif
}

public func lzprint(_ items: Any..., separator: String = " ", terminator: String = "\n", level: LogLevel = .default) {
    #if DEBUG
    if LogLevelMangager.default.rawValue >= level.rawValue {
        print(items, separator: separator, terminator: terminator)
    }
    #endif
}
