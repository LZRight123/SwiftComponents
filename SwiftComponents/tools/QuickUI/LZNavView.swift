//
//  LZNavView.swift
//  dsx
//
//  Created by liangze on 2020/4/12.
//  Copyright © 2020 liangze. All rights reserved.
// 

import UIKit


public class LZNavView: UIView {
    
    let contentView = UIView(color: .clear)
    
    public override var intrinsicContentSize: CGSize { .init(width: ScreenWidth * 0.6, height: 30) }
    
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
        backgroundColor = .clear
        add(contentView).snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: ScreenWidth, height: NavBarH))
        }
    }
   

    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let touchBound = CGRect(x: -ScreenWidth, y: 0, width: ScreenWidth * 2, height: NavBarH)
        return touchBound.contains(point)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.snp.remakeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: ScreenWidth, height: NavBarH))
        }
    }

}
