//
//  MJRefresh+RX.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/8/7.
//  Copyright © 2020 liangze. All rights reserved.
//

import RxSwift
import RxCocoa
import MJRefresh
 
//对MJRefreshComponent增加rx扩展
public extension Reactive where Base: MJRefreshComponent {
     
    //正在刷新事件
    var refreshing: ControlEvent<Void> {
        let source: Observable<Void> = Observable.create {
            [weak control = self.base] observer  in
            if let control = control {
                control.refreshingBlock = {
                    observer.on(.next(()))
                }
            }
            return Disposables.create()
        }
        return ControlEvent(events: source)
    }
     
    //停止刷新
    var endRefreshing: Binder<Bool> {
        return Binder(base) { refresh, isEnd in
            if isEnd {
                refresh.endRefreshing()
            }
        }
    }
}
