//
//  File.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/12/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit
public extension UINavigationController {
    func getvc<T: UIViewController>(_ aClass: T.Type) -> T? {
        return viewControllers.filter{ $0.isMember(of: aClass) }.first as? T
    }
    
    func getvcReverse<T: UIViewController>(_ aClass: T.Type) -> T?  {
        return viewControllers.filter{ $0.isMember(of: aClass) }.last as? T
    }
       
    @objc func getvcCount(_ aClass: AnyClass) -> Int {
        let count = viewControllers.filter{ $0.isMember(of: aClass) }.count
        return count
    }
    
    @objc func getvc(stackIndex: Int) -> UIViewController? {
        if stackIndex >= viewControllers.count {
            return nil
        }
        return viewControllers[viewControllers.count - 1 - stackIndex]
    }
    
    func push(_ toVC: UIViewController, popMiddle beforeVC: UIViewController, before: Int = 0, animation: Bool = true) {
        pushViewController(toVC, animated: animation)
        
        if let i = viewControllers.firstIndex(where: { $0 == beforeVC }) {
            let index = max(0, i - before)
            var controllers = Array(viewControllers[0...(index)])
            controllers.append(toVC)
            viewControllers = controllers
        }
    }
    
    // 从1开始 到 count结束
    @objc func popBefore(_ index: Int) {
        let count = viewControllers.count
        guard index >= 1 && index <= count else {
            return
        }
        
        let targetVC = viewControllers[count - 1 - index]
        popToViewController(targetVC, animated: true)
    }
    
    @objc func popFromStack(_ vc: UIViewController) {
        viewControllers = viewControllers.filter { $0 != vc }
    }
    
    func popFromStack<T: UIViewController>(vcType: T.Type) {
        viewControllers = viewControllers.filter { !($0 is T) }
    }
        
}

