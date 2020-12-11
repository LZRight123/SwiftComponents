//
//  UIApplicationExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 3/30/19.
//  Copyright © 2019 SwifterSwift
//

#if canImport(UIKit)
import UIKit

#if os(iOS) || os(tvOS)

public extension UIApplication {
        
    var currentWindow: UIWindow? {
        delegate?.window ?? nil
    }
    
    func call(_ phone: String) {
        let phoneURL = URL(string: "telprompt://" + phone)!
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(phoneURL)
                }
            }
        }
    }
    
}

#endif

#endif
