//
//  Networking+RX.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/4.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension CGI: ReactiveCompatible {}
public extension Reactive where Base == CGI {
    static func request(_ targetType: TargetType) -> Single<MoyaResult> {
        return Single.create {  single in
            let cancellableToken = CGI.request(targetType) { single(.success($0)) }

            return Disposables.create {
                cancellableToken.cancel()
            }
        }
    }
    
    static func request(_ targetType: TargetType) -> Single<Response> {
        return CGI.defaultProvider.rx.request(.init(targetType))
    }
    
    static func request<T: Convertible>(_ targetType: TargetType, modelType: T.Type, atKeyPath key: String? = "data") -> Single<T?> {
        return CGI.defaultProvider.rx.request(.init(targetType)).mapObject(T.self, atKeyPath: key)
    }
    
    static func request<T: Convertible>(_ targetType: TargetType, modelArrayType: T.Type, atKeyPath key: String? = "data") -> Single<[T]?> {
        return CGI.defaultProvider.rx.request(.init(targetType)).mapArray(T.self, atKeyPath: key)
    }
}
