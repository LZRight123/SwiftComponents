//
//  AppDelegate.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/7/22.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit
import URLNavigator

//https://dev.oms.luguanjia.com/mini?id=221|officeName=湖北鹿管家|name=钟秀玲|userRoyaltyCode=offline|defaultDelivery=null

let navigator = Router()

struct TestClassModel {
    static var share = TestClassModel()
    
    var title = "没有复制前"
    init() {
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, NavigatorDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        register()
        
        
        let h5 = "https://sup.test.yyjzt.com/h5/information/index.html#/announcementDetails?applySource=2&state=0&supInformationId=132"
        
        let s = "gongyingshang://activity/webview?title=公告资讯明细&TYPE=7&url=" + h5.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)!
        
        let s2 = "gongyingshang://activity/webview?title=公告资讯明细&TYPE=7&url=\(h5)".addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)!
        
    
        
        
        /// 原始字符串 先解码 再编码
        let r01 = s.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)
        let r02 = s2.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed)
            
        print("")
//        let regex = "[\\u4e00-\\u9fa5]"
//
//        let s = try? NSRegularExpression(pattern: regex, options: .caseInsensitive).stringByReplacingMatches(in: st, options: .reportCompletion, range: .init(location: 0, length: st.count), withTemplate: "")
//
//        let t = "123".components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
//
//        let nonDigits = CharacterSet.decimalDigits.inverted
//            let numStr = st.trimmingCharacters(in: nonDigits)
//            let range = (st as NSString).range(of: numStr)
//        let sub  = st.nsString.substring(to: range.length)

        
        
        
        window = UIWindow()
        window?.backgroundColor = .white
        
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        let or = "2999.997000"
        
        let format = NumberFormatter()
        format.positiveFormat = "0.##;"
        format.roundingMode = .down
        //            format.roundingMode = .roundDown
        //            format.numberStyle = .decimal
        let r2 = format.string(for: Decimal(string: or))
        navigator.delegate = self
        print(r2)
        // Override point for customization after application launch.
        return true
    }


    
    func register() {
         /// A 模块
        navigator.register("https://dev.oms.luguanjia.com/<value>") { (url, values, contexts) -> UIViewController? in
            print("")
            let want = contexts
            // 给a模块赋值
//            let vc = UIViewController()
//            return vc
            return nil
        }
        
        navigator.handle("myapp://xxx") { (_, _, _) -> Bool in
            return false
        }
        
        
        let r = navigator.open("myapp://xxx")
        
        var haha = TestClassModel()

        navigator.addPost("myapp://xxx") { (_, _, _) -> Any? in
            return haha.title
        }
        
        
        
        var postvalue = navigator.postURL("myapp://xxx", context: nil)
        print("")
        
        haha.title = "第二次"
        postvalue = navigator.postURL("myapp://xxx", context: nil)
        print("")
     
    }
    
    
    func bModel() {
        /// B模块
        struct AModel {
            var title = "哈哈"
            
        }
        var model = AModel()
        print("开始")
        /// 执行 block
//        navigator.push("https://dev.oms.luguanjia.com/woca", context: model.title)
        print("结束")
    }
    

//    <UIViewController: 0x10744d970>
    func shouldPush(viewController: UIViewController, from: UINavigationControllerType) -> Bool {
        print("")
        return false
    }

}

