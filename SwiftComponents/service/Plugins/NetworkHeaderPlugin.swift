//
//  NetworkHeaderPlugin.swift
//  fenJianXiao_iOS
//
//  Created by liangze on 2019/12/17.
//  Copyright © 2019 liangze. All rights reserved.
//

import Foundation
import Moya

// 插入header
public class NetworkHeaderPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var newRequest = request
        newRequest.setValue("lz_header", forHTTPHeaderField: "lz_value")
        newRequest.setValue("plaform", forHTTPHeaderField: "ios")
        return newRequest
    }
}
