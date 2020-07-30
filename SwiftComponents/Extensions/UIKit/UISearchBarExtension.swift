//
//  CustomSearchBar.swift
//  dsx
//
//  Created by liangze on 2020/4/16.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit

extension UISearchBar {
    var field: UITextField? {
        for view in subviews.last!.subviews {
            if view is UITextField {
                return view as? UITextField
            }
        }
        return nil
    }
    
    var cancelBtn: UIButton? {
        for view in subviews.last!.subviews {
            if let btn = view as? UIButton, btn.currentTitle == "取消" {
                return btn
            }
        }
        return nil
    }
}

