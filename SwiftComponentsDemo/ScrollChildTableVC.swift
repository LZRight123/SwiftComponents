//
//  ScrollChildTableVC.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/9/21.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit

class VM: NSObject {
    var tableView: UITableView?
    weak var vc: UIViewController?
}

class ScrollChildTableVC: UIViewController {

    lazy var vm = VM()
    let tableView = UITableView(style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        vm.tableView = tableView
        vm.vc = self
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("ScrollChildTableVC 释放了")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
