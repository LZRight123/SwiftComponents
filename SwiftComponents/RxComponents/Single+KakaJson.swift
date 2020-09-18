//
//  Single+KakaJson.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/4.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation
import KakaJSON
import Moya
import RxSwift

/// Extension for processing Responses into Convertible objects through KakaJSON
public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
//    func mapObject<T: Convertible>(_ type: T.Type) -> Single<T> {
//        return flatMap { response -> Single<T> in
//            Single.just(try response.mapObject(type))
//        }
//    }
//
//    /// Maps data received from the signal into an array of objects
//    /// which implement the Convertible protocol and returns the result back
//    /// If the conversion fails, the signal errors.
//    func mapArray<T: Convertible>(_ type: T.Type) -> Single<[T]> {
//        return flatMap { response -> Single<[T]> in
//            Single.just(try response.mapArray(type))
//        }
//    }

    /// Maps data received from the signal into an object
    /// which implements the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapObject<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String? = nil) -> Single<T?> {
        guard let keyPath = keyPath else {
            return flatMap { response -> Single<T?> in
                Single.just(try? response.mapObject(type))
            }
        }
        return flatMap { response -> Single<T?> in
            Single.just(try? response.mapObject(type, atKeyPath: keyPath))
        }
    }

    /// Maps data received from the signal into an array of objects
    /// which implement the Convertible protocol and returns the result back
    /// If the conversion fails, the signal errors.
    func mapArray<T: Convertible>(_ type: T.Type, atKeyPath keyPath: String? = nil) -> Single<[T]?> {
        guard let keyPath = keyPath else {
            return flatMap { response -> Single<[T]?> in
                Single.just(try? response.mapArray(type))
            }
        }
        return flatMap { response -> Single<[T]?> in
            Single.just(try? response.mapArray(type, atKeyPath: keyPath))
        }
    }
}
