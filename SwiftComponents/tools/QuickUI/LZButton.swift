//
//  LZButton.swift
//  fenJianXiao_iOS
//
//  Created by liangze on 2019/12/9.
//  Copyright © 2019 liangze. All rights reserved.
//

import UIKit

public class LZButton: UIButton {
    var responseSize = CGSize(width: 44, height: 44)
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds = self.bounds
        //若原热区小于44x44，则放大热区，否则保持原大小不变
        let widthDelta = max(responseSize.width - bounds.width, 0)
        let heightDelta = max(responseSize.height - bounds.height, 0)
        bounds = bounds.insetBy(dx: -0.5 * widthDelta, dy: -0.5 * heightDelta)
        return bounds.contains(point)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    func setupUI() {
        
    }
    
}
