//
//  LZTransitioningAnimate.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

public extension UIViewController {
    @discardableResult
    func setupTransitioningAnimate(_ animator: LZTransitioningAnimate) -> Self{
        modalPresentationStyle = .custom
        transitioningDelegate = animator
        return self
    }
}

open class LZTransitioningAnimate: NSObject {
    open var duration: TimeInterval = 0.25
    
    public static let present = LZPresentTransitioningAnimate()
    // @objc static let presentNoBackground = TransitioningAnimateNoBackgroundPresent()
    public static let pop = LZPopupTransitioningAnimate()
    public static let rightToLeft = LZRightToLeftTransitioningAnimate()
}

//MARK: UIViewControllerTransitioningDelegate
extension LZTransitioningAnimate: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return LZPresentationControlller(presentedViewController: presented, presenting: presenting)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

//MARK: UIViewControllerAnimatedTransitioning
extension LZTransitioningAnimate: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        //FIXME: -subclass implement
    }
}
