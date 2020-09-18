//
//  LZRightToLeft.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/7.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit

open class LZRightToLeftTransitioningAnimate: LZTransitioningAnimate {
    
    open override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        if transitionContext.viewController(forKey: .to)?.isBeingPresented == true {
            let toView   = transitionContext.view(forKey: .to)!
            toView.transform = CGAffineTransform(translationX: containerView.bounds.size.width, y: 0)
            UIView.animate(withDuration: self.duration, animations: {
                toView.transform = CGAffineTransform.identity
            }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: self.duration, animations: {
                fromView?.transform = CGAffineTransform(translationX: containerView.bounds.size.width, y: 0)
            }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
    
}
