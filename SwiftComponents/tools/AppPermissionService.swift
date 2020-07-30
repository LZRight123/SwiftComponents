//
//  AppPermissionService.swift
//  fenJianXiao_iOS
//
//  Created by ash on 2020/1/16.
//  Copyright © 2020 liangze. All rights reserved.
//

import Foundation
import CoreLocation

/// App 权限服务
struct AppPermissionService {
    static let shared = AppPermissionService()
    
    private init() {
        
    }

    //定位
    func checkLocationPermission() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:  //用户尚未做出选择
            return false
        case .restricted:  //未被授权
            return false
        case .denied:  //用户拒绝
            return false
        case .authorizedWhenInUse:  //使用期间定位
            return true
        case .authorizedAlways:  //一直定位
            return true
        default:
            return false
        }
    }
    
}
