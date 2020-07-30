//
//  Notification.Name+Extension.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/12/28.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

extension Notification.Name {
   
    static let af_NetworkingReachabilityDidChangeNotification = Notification.Name("com.alamofire.networking.reachability.change")
    

}

extension Notification.Name {
    enum DSX {
        private static let pre = "DSX.Notification."
        static let dsxApplyPartsSucess: Notification.Name = .init(pre + "ApplyPartsSucess")
    }
 
    private static let pre = "DSX.Notification."
    static let dsxApplyPartsSucess: Notification.Name = .init(pre + "ApplyPartsSucess")
}
