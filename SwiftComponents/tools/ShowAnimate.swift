//
//  ShowAnimate.swift
//  JadeSocial
//
//  Created by liangze on 2020/4/22.
//  Copyright © 2020 Rick. All rights reserved.
//

import UIKit

public struct ShowAnimatePriority: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    public let value: Float
    
    public init(floatLiteral value: Float) {
        self.value = value
    }
    
    public init(_ value: Float) {
        self.value = value
    }
    

    public static var required: ShowAnimatePriority {
        return 1000.0
    }
    
    public static var high: ShowAnimatePriority {
        return 750.0
    }
    
    public static var medium: ShowAnimatePriority {
        return 500.0
    }
    
    public static var low: ShowAnimatePriority {
        return 250.0
    }
}

public protocol ShowAnimate {
    var sa_animationView: UIView { get }
    var showAnimatePriority: ShowAnimatePriority { get }
    
    var sa_isShowing: Bool { get }
    
    
    func showAt(vc: UIViewController?, animation: Bool)
    func dismissOut(animation: Bool)
}



public protocol ShowAnimatePopUp: ShowAnimate {
}

public protocol ShowAnimatePresent: ShowAnimate { }

public extension ShowAnimate where Self: UIViewController {
    var sa_isShowing: Bool {
        parent != nil && view.superview != nil
    }

    
    func sortedChildView() {
        let subs = parent?.children.compactMap { $0 as? ShowAnimate }
        let items = subs?.sorted { (i, j) -> Bool in
            return i.showAnimatePriority.value < j.showAnimatePriority.value
        }
        guard let childs = items else { return }
    
        for item in childs {
            let vc = item as! UIViewController
            parent?.view.bringSubviewToFront(vc.view)
        }
    }
}

public extension ShowAnimatePopUp {
    var showAnimatePriority: ShowAnimatePriority { .medium }
}
public extension ShowAnimatePresent {
    var showAnimatePriority: ShowAnimatePriority { .low }
}

//MARK: - popup 从中间放大
public extension ShowAnimatePopUp where Self: UIViewController {
    func showAt(vc: UIViewController?, animation: Bool = true) {
        vc?.add(self)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        sortedChildView()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        sa_animationView.transform = .init(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: animation ? 0.25 : 0, animations: {
            self.sa_animationView.transform = .init(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    func dismissOut(animation: Bool = true) {
        view.endEditing(true)
        if presentingViewController != nil {
            dismiss(animated: false, completion: nil)
            return
        }
        
        UIView.animate(withDuration: animation ? 0.25 : 0, animations: {
            self.sa_animationView.transform = .init(scaleX: 0.01, y: 0.01)
        }) { _ in
            self.remove()
        }
    }
}


//MARK: - present 从下往上
public extension ShowAnimatePresent where Self: UIViewController {
    func showAt(vc: UIViewController?, animation: Bool = true) {
        vc?.add(self)
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        sortedChildView()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        sa_animationView.transform = .init(translationX: 0, y: ScreenHeight)
        
        UIView.animate(withDuration: animation ? 0.25 : 0, animations: {
            self.sa_animationView.transform = .identity
        }, completion: nil)
    }
    
    func dismissOut(animation: Bool = true) {
        view.endEditing(true)
        if presentingViewController != nil {
            dismiss(animated: false, completion: nil)
            return
        }
        
        UIView.animate(withDuration: animation ? 0.25 : 0, animations: {
            self.sa_animationView.transform = .init(translationX: 0, y: ScreenHeight)
        }) { _ in
            self.remove()
        }
    }
}
