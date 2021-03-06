//
//  RXComponent.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/8/7.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation

@_exported import RxSwift
@_exported import RxCocoa
@_exported import RxRelay
@_exported import RxViewController
@_exported import RxOptional
@_exported import RxDataSources
@_exported import RxGesture
 
//以下都可以考虑使用
//pod 'Moya/RxSwift'
//https://github.com/Guoxiafei/Moya-KakaJson


//https://www.hangge.com/blog/cache/detail_2049.html
//Swift - RxSwift的使用详解61（sendMessage和methodInvoked的区别）
// sendMessage 在原方法调用前
// methodInvoked 在原方法调用后

//private var dispoaseBagKey: Void?    搞成uiviewcontroller的分类比较好
//public extension NSObject {
//    var dispoaseBag: DisposeBag {
//        get {
//            let dispoaseBag: DisposeBag
//            if let value = objc_getAssociatedObject(self, &dispoaseBagKey) as? DisposeBag {
//                dispoaseBag = value
//            } else {
//                dispoaseBag = DisposeBag()
//                objc_setAssociatedObject(self, &dispoaseBagKey, dispoaseBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            }
//            return dispoaseBag
//        }
//    }
//}

public extension SectionModel {
    subscript(_ index: Int) -> ItemType {
        return items[index]
    }
}


public extension BehaviorRelay {
    func refresh() {
        accept(value)
    }
    
}

