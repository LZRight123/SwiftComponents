//
//  Networking.swift
//  Elena
//
//  Created by ash on 2019/10/15.
//  Copyright © 2019 荣恒. All rights reserved.
//

import Foundation
@_exported import Moya
@_exported import Alamofire
@_exported import KakaJSON
@_exported import SwiftyJSON

public let networkActivityPlugin = NetworkActivityPlugin{ (changeType: NetworkActivityChangeType, targetType: TargetType) in
    DispatchQueue.main.async {
        switch(changeType){
        case .ended:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        case .began:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
}


public protocol NetworkingType {
    associatedtype T: TargetType
    var provider: Networking<T> { get }
}

open class Networking<Target: TargetType>: MoyaProvider<Target> {

    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.af.default,
                plugins: [PluginType] = [ResponsePlugin(), networkActivityPlugin]) {
        configuration.timeoutIntervalForRequest = 15
        
        let newPlugins = plugins + [NetworkHeaderPlugin(), CustomNetworkLoggerPlugin()]

        let session = Session(configuration: configuration) //moya14
//        let manager = Manager(configuration: configuration) //moya13

//        manager.startRequestsImmediately = false
//        requestClosure: { (endpoint, done) in
//            guard var request = try? endpoint.urlRequest() else { return }
//
//            request.timeoutInterval = 2
//            done(.success(request))
//        }
        super.init(session: session, plugins: newPlugins) //moya14
//        super.init(manager: manager, plugins: newPlugins) //moya13

    }
    
    @discardableResult
    open override func request(_ target: Target,
                   callbackQueue: DispatchQueue? = .none,
                   progress: ProgressBlock? = .none,
                   completion: @escaping Completion) -> Cancellable {
        super.request(target, callbackQueue: callbackQueue, progress: progress, completion: completion)
    }
    
    /// 暂不公开
    @discardableResult
    func request<T>(_ target: Target, dataType: T.Type, completion: @escaping (MoyaResult, NetResponse<T>) -> Void ) -> Cancellable {
        return request(target) { (r) in
            if r.error != nil {
                completion(r, .init(code: .requestError, message: "网络请求失败", data: nil))
            } else {
                let o: NetResponse<T> = r.mapNetResponse(T.self) ?? .init(code: .parsingError, message: "数据解析失败", data: nil)
                completion(r, o)
            }
        }
    }
 
    @discardableResult
    open func requestObject<T: Convertible>(_ target: Target, modeType: T.Type, atKeyPath keyPath: String? = nil, completion: @escaping (MoyaResult, T?) -> Void ) -> Cancellable {
        return request(target) { (r) in
            completion(r, r.mapObject(T.self, atKeyPath: keyPath))
        }
    }
    
    public func requestArray<T: Convertible>(_ target: Target, modeType: T.Type, atKeyPath keyPath: String? = nil, completion: @escaping (MoyaResult, [T]?) -> Void ) -> Cancellable {
        return request(target) { (r) in
            completion(r, r.mapArray(T.self, atKeyPath: keyPath))
        }
    }
}



public struct CGI {
    public static var defaultProvider = Networking<MultiTarget>()
    public  static func request(_ target: TargetType, completion: @escaping Completion) -> Cancellable {
        return defaultProvider.request(.init(target), completion: completion)
    }
    /// 暂不公开
    @discardableResult
    static func request<T>(_ target: TargetType, dataType: T.Type, completion: @escaping (MoyaResult, NetResponse<T>) -> Void ) -> Cancellable {
        return defaultProvider.request(.init(target), dataType: dataType, completion: completion)
    }
    
    @discardableResult
    public static func requestObject<T: Convertible>(_ target: TargetType, modeType: T.Type, atKeyPath keyPath: String? = "data", completion: @escaping (MoyaResult, T?) -> Void ) -> Cancellable {
        return defaultProvider.requestObject(.init(target), modeType: modeType, completion: completion)
    }
    
    @discardableResult
    public static func requestArray<T: Convertible>(_ target: TargetType, modeType: T.Type, atKeyPath keyPath: String?  = "data", completion: @escaping (MoyaResult, [T]?) -> Void ) -> Cancellable {
        return defaultProvider.requestArray(.init(target), modeType: modeType, completion: completion)
    }
    
}
