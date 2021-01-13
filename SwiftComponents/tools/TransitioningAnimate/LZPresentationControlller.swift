//
//  LZPresentationControlller.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/23.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

open class LZPresentationControlller: UIPresentationController {
    public private(set) lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)
        return view
    }()
    
    open override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView?.frame ?? UIScreen.main.bounds
        containerView?.addSubview(dimmingView)
        dimmingView.addSubview(presentedViewController.view)
        
        let transitionCoordinator = presentedViewController.transitionCoordinator
        dimmingView.alpha = 0
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1
        }, completion: nil)
    }
    
    open override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    open override func dismissalTransitionWillBegin() {
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0
        }, completion: nil)
    }
    
    open override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed  {
            dimmingView.removeFromSuperview()
        }
    }
}
