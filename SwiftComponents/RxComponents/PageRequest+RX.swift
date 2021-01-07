//
//  PageRequest+RX.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/8/10.
//  Copyright © 2020 liangze. All rights reserved.
//

import RxSwift
import RxCocoa
extension PageRequest: ReactiveCompatible { }
public extension Reactive where Base == PageRequest {
    /// 重置到开始 下拉刷新 等
    var reset: Binder<Any> {
        return .init(base) { (request, _) in
            request.reset()
        }
    }
    /// 上提加载
    var increase: Binder<Any> {
        return .init(base) { (request, _) in
            request.increase()
        }
    }
    /// 上提后 没数据回滚一格
    var rollback: Binder<Any> {
        return .init(base) { (request, _) in
            request.rollback()
        }
    }
}
