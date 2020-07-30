//
//  UIControlExtensions.swift
//  dsx
//
//  Created by liangze on 2020/4/12.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit


public extension UIControl {
    func add(target: Any?, action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
}
