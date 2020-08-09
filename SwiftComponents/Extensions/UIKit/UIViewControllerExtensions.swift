//
//  UIViewControllerExtensions.swift
//  SwifterSwift
//
//  Created by Emirhan Erdogan on 07/08/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Initializers
public extension UIViewController {
   static func fromSb(_ name: String) -> Self {
        let sb = UIStoryboard(name: name, bundle: Bundle(for: self))
        guard let vc = sb.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("ViewController of type '\(self).' inside '\(identifier).sb is nil?.'")
        }
        return vc
    }

    static func fromNib() -> Self {
        let vc = self.init(nibName: nibName, bundle: Bundle(for: self)) as Self
        return vc
    }
}

// MARK: - Properties
public extension UIViewController {
    static var identifier: String { return String(describing: self) }
    
    static var nibName: String { return String(describing: self) }
}

// MARK: - Methods
public extension UIViewController {

    
    
    //EZSE: Makes the UIViewController register tap events and hides keyboard when clicked somewhere in the ViewController.
    func hideKeyboardWhenTappedAround(cancelTouches: Bool = false) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelTouches
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @discardableResult
    func add<T: UIViewController>(_ child: T) -> T {
        return add(child, toView: view)
    }
    
    @discardableResult
    func add<T: UIViewController>(_ child: T, toView: UIView) -> T {
        addChild(child)
        toView.addSubview(child.view)
        child.didMove(toParent: self)
        return child
    }
    
    func add(childs: UIViewController...) {
        childs.forEach { (child) in
            add(child)
        }
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    @discardableResult
    func pushVC<T: UIViewController>(_ vc: T, animated: Bool = true) -> T {
        navigationController?.pushViewController(vc, animated: animated)
        return vc
    }
    
    ///EZSE: Pops the top view controller from the navigation stack and updates the display.
    func popVC(_ animated: Bool = true) {
        _ = navigationController?.popViewController(animated: animated)
    }
    ///EZSE: Dismisses the view controller that was presented modally by the view controller.
    func dismissVC(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    @discardableResult
    func presentVC<T: UIViewController>(_ viewControllerToPresent: T, animated: Bool = true,  completion: (() -> Void)? = nil) -> T {
        var presentingVC: UIViewController? =  self
        while presentingVC?.presentedViewController != nil {
            presentingVC = presentingVC?.presentedViewController
        }
        presentingVC?.present(viewControllerToPresent, animated: animated, completion: completion)
        return viewControllerToPresent
    }
    
    
    /// 开关交互手势
    func backGestureEnabled(_ isEnabled: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = isEnabled
    }
    
    static func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

#endif
