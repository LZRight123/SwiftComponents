//
//  AppstoreVersionUpdate.swift
//  SwiftComponents
//
//  Created by 梁泽 on 2021/1/14.
//

import Foundation
import SwiftyJSON
import KakaJSON

public struct AppstoreVersionUpdate {
    
    public let itunesUpdateUrl: String
    public let itunesJumpUrl: String
    public init(itunesUpdateUrl: String, itunesJumpUrl: String) {
        self.itunesUpdateUrl = itunesUpdateUrl
        self.itunesJumpUrl = itunesJumpUrl
    }
    
    public func checkUpdate(completion: @escaping (AppstoreVersionUpdate.Result?) -> Void) {
        guard let url = URL(string: itunesUpdateUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, r, e) in
            struct Response: Convertible {
                var results = [Result]()
                var resultCount = 0
            }
            
            let m = data?.kj.model(Response.self)?.results.first
            completion(m)
        }.resume()
    }
    
    
    public struct Result: Convertible {
        public init() {
            
        }
        var description = ""
//        智药通App是一款服务于各大药企生产厂商、商业公司和终端客户的移动销售助手。 平台依托九州通医药集团的行业资源优势，通过订单管理、流向管理、数据报表、我的业绩等实用功能，有效提高了医药流通效率，削减了行业成本，成功帮助10000+业务团队在平台上高效地开展业务，备受医药行业青睐。,
        var version = "" // 6.23.0,
        var bundleId = "" // com.fbbc.sup,
        var releaseDate = "" // 2019-01-24T02:25:08Z,
        var trackId = "" // 1446713235,
        var minimumOsVersion = "" // 9.0,
        var formattedPrice = "" // 免费,
        var currentVersionReleaseDate = "" // 2020-12-20T03:20:08Z,
        var userRatingCount = "" // 80,
        var artistId = "" // 1413091723,
        var artistName = "" // 北京榕知科技有限公司,
        var price = "" // 0,
        var trackCensoredName = "" // 智药通,
        var trackName = "" // 智药通,
        var releaseNotes = "" // 1、新增智能拜访助手，多维度数据计算，帮助业务员快速制定拜访计划
//    2、新增任务系统，支持向业务员派发资信超期和证照超期任务，管理者可查看下属任务完成情况
//    3、下属业绩报表支持根据业务分管范围筛选数据,
        var isVppDeviceBasedLicensingEnabled = 1
        var sellerName = "Beijing Rongzhi Technology Co., Ltd.,"
        
        public var hasNewVersion: Bool {
            if version.count < 0 {
                return false
            }
            let infoJson = JSON(Bundle.main.infoDictionary ?? [:])
            let currentVersion = infoJson["CFBundleShortVersionString"].stringValue
            let r = version > currentVersion
            return r
        }
    }
}





