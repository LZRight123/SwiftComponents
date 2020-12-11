//
//  HUD+RX.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/8/10.
//  Copyright © 2020 liangze. All rights reserved.
//

import RxSwift
import RxCocoa
import MJRefresh

//MARK: - UIView
public extension Reactive where Base: UIView {
    
    var isShowLoading: Binder<Bool> {
        return Binder(self.base) { view, isShow in
            if isShow {
                view.showLoading()
            } else {
                view.hud?.removeFromSuperview()
            }
        }
    }
    
    var toast: Binder<String?> {
        return .init(base) { (view, text) in
            view.showText(text)
        }
    }
    
    var showText: Binder<String?> {
        return .init(base) { (view, text) in
            view.showText(text)
        }
    }
    
    
    var toastAtBottom: Binder<String?> {
        return .init(base) { (view, text) in
            view.showText(text, position: .bottom)
        }
    }
    
}


//MARK: - UIViewController
public extension Reactive where Base: UIViewController {
    
    var isShowLoading: Binder<Bool> {
        return Binder(self.base) { vc, isShow in
            if isShow {
                vc.view.showLoading()
            } else {
                vc.view.hud?.removeFromSuperview()
            }
        }
    }
    
    var toast: Binder<String?> {
        return .init(base) { (vc, text) in
            vc.view.showText(text)
        }
    }
    
    var showText: Binder<String?> {
        return .init(base) { (vc, text) in
            vc.view.showText(text)
        }
    }
    
    var toastAtBottom: Binder<String?> {
        return .init(base) { (vc, text) in
            vc.view.showText(text, position: .bottom)
        }
    }

}
