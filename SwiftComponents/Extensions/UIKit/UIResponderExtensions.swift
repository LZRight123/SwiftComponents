//
//  UIRe+Extensions.swift
//  JadeSocial
//
//  Created by liangze on 2020/4/5.
//  Copyright © 2020 Rick. All rights reserved.
//

import UIKit

public extension UIResponder {
    func animate(duration: TimeInterval = 0.25, delay: TimeInterval = 0, options: UIView.AnimationOptions = [.curveEaseInOut], animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: completion)
    }
}
