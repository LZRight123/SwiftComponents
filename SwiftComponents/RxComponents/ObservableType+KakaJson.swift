//
//  ObservableType+KakaJson.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/4.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation
import RxSwift
import KakaJSON
import Moya

/// Extension for processing Responses into Convertible objects through KakaJSON
public extension ObservableType where Element == Response {

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
//    func mapObject<T: Convertible>(_ type: T.Type) -> Observable<T> {
//        return flatMap { response -> Observable<T> in
//            Observable.just(try response.mapObject(type))
//        }
//    }
//
//    /// Maps data received from the signal into an array of objects
//    /// which implement the Convertible protocol and returns the result back
//    /// If the conversion fails, the signal errors.
//    func mapArray<T: Convertible>(_ type: T.Type) -> Observable<[T]> {
//        return flatMap { response -> Observable<[T]> in
//            Observable.just(try response.mapArray(type))
//        }
//    }

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String? = nil) -> Observable<T?> {
        guard let keyPath = keyPath else {
            return flatMap { response -> Observable<T?> in
                Observable.just(try? response.mapObject(type))
            }
        }
        
        return flatMap { response -> Observable<T?> in
            Observable.just(try? response.mapObject(T.self, atKeyPath: keyPath))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String? = nil) -> Observable<[T]?> {
        guard let keyPath = keyPath else {
            return flatMap { response -> Observable<[T]?> in
                Observable.just(try? response.mapArray(type))
            }
        }
        return flatMap { response -> Observable<[T]?> in
            Observable.just(try? response.mapArray(T.self, atKeyPath: keyPath))
        }
    }
}
