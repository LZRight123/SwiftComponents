//
//  File.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/12/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit
extension UINavigationController {
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
    
    @objc func push(_ toVC: UIViewController, popMiddle beforeVC: UIViewController, before: Int = 0, animation: Bool = true) {
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
    
    /// SwifterSwift: Make navigation controller's navigation bar transparent.
    ///
    /// - Parameter tint: tint color (default is .white).
    func makeTransparent(withTint tint: UIColor = .white) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [.foregroundColor: tint]
    }
    
}

public extension UINavigationController {

    /// SwifterSwift: Pop ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - animated: Set this value to true to animate the transition (default is true).
    ///   - completion: optional completion handler (default is nil).
    func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    /// SwifterSwift: Push ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - viewController: viewController to push.
    ///   - completion: optional completion handler (default is nil).
    func pushViewController(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }


}
