//
//  Property+RX.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/7.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit
import RxSwift

//MARK: - RX DisposeBag

//private var disposeBagKey: Void?
//public extension UIViewController {
//    var disposeBag: DisposeBag {
//        get {
//            let badge: DisposeBag
//            if let value = objc_getAssociatedObject(self, &disposeBagKey) as? DisposeBag {
//                badge = value
//            } else {
//                badge = DisposeBag()
//                objc_setAssociatedObject(self, &disposeBagKey, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//            return badge
//        }
//        set {
//             objc_setAssociatedObject(self, &disposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}



//public extension UIView {
//    var disposeBag: DisposeBag {
//        get {
//            let badge: DisposeBag
//            if let value = objc_getAssociatedObject(self, &disposeBagKey) as? DisposeBag {
//                badge = value
//            } else {
//                badge = DisposeBag()
//                objc_setAssociatedObject(self, &disposeBagKey, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//            return badge
//        }
//        set {
//             objc_setAssociatedObject(self, &disposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//}


