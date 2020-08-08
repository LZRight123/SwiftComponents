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
    /// SwifterSwift: Check if ViewController is onscreen and not hidden.
    var isVisible: Bool {
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        return isViewLoaded && view.window != nil
    }

}

// MARK: - Methods
public extension UIViewController {

    /// SwifterSwift: Assign as listener to notification.
    ///
    /// - Parameters:
    ///   - name: notification name.
    ///   - selector: selector to run with notified.
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }

    /// SwifterSwift: Unassign as listener to notification.
    ///
    /// - Parameter name: notification name.
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }

    /// SwifterSwift: Unassign as listener from all notifications.
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }

//    func addKeyboardWillChangeFrameNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameChange(_:)), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
    
//    @objc private func keyboardFrameChange(_ notification: Notification) {
//        let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
//        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
//        let endY = frame?.origin.y ?? ScreenHeight
//        let offset = max(0, ScreenHeight - endY - SafeBottomArea)
//        keyboardWillChangeFrame(-offset, duration: duration ?? 0.25)
//    }
    
    @objc func keyboardWillChangeFrame(_ offsetY: CGFloat, duration: TimeInterval) {
        
    }
    
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
    
    @discardableResult
    func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.count == 0 {
            allButtons.append("OK")
        }

        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                completion?(index)
            })
            alertController.addAction(action)
            // Check which button to highlight
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                alertController.preferredAction = action
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }
}

#endif
