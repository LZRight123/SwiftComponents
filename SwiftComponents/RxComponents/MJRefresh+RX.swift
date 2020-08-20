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


public enum FooterRefreshStatus {
    case endFooterRefresh
    // 这个枚举由于在我项目中经常用到，所以我定一个关联值的枚举。
    // 项目中需要：
    //  - 数据为空的时候隐藏 `mj_footer`，否则显示；
    //  - 然后判断没有更多数据就调用 `endRefreshingWithNoMoreData()`
    //    否则 `endRefreshing()`
    case footerStatus(isNoMoreData: Bool, isHidden: Bool = false)
}

public extension Reactive where Base: MJRefreshFooter {
    var endRefreshState: Binder<FooterRefreshStatus> {
        return .init(base) { (footer, status) in
            switch status {
            case .endFooterRefresh:
                footer.isHidden = false
                footer.endRefreshing()
            case let .footerStatus(isNoMoreData, isHidden):
                isNoMoreData ? footer.endRefreshingWithNoMoreData() : footer.endRefreshing()
                footer.isHidden = isHidden
            }
        }
    }
}
