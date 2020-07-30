//
//  mc.swift
//  Deer
//
//  Created by liangze on 2020/7/21.
//  Copyright © 2020 zhuxiaoliang. All rights reserved.
//

public struct MC<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol MCCompatible { }

extension MCCompatible {
    public static var mc: MC<Self>.Type {
          get {  return MC<Self>.self }
          set {  }
    }
    
    public var mc: MC<Self> {
        get { return MC(self) }
        set { }
    }
}

extension NSObject: MCCompatible { }
extension Int: MCCompatible { }
extension Double: MCCompatible { }
extension Float: MCCompatible { }
extension CGFloat: MCCompatible { }
extension CGSize: MCCompatible { }
extension CGPoint: MCCompatible { }
extension Array: MCCompatible { }
extension String: MCCompatible { }

