//
//  AppDelegate.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/7/22.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
        print(r2)
        // Override point for customization after application launch.
        return true
    }




}

