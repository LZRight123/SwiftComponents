//
//  WrapBtn.swift
//  SwiftComponents
//
//  Created by 梁泽 on 2021/3/9.
//

import UIKit
import SwifterSwift

open class WrapBtn: LZView {
    public let btn = UIButton(font: .font18, title: "", titleColor: .white).then {
        $0.backgroundColor = .main
    }
    public let maskBtn = UIButton(color: .init(hex: "#FFFFFF99"))
    
    public var title: String = "" {
        didSet {
            btn.setTitleForAllStates(title)
        }
    }
    
    public var isCanClickBtn: Bool = true {
        didSet {
            maskBtn.isHidden = isCanClickBtn
        }
    }
    
    public override func setupUI() {
        isCanClickBtn = true
        add(btn).snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        add(maskBtn)
        maskBtn.snp.makeConstraints { $0.edges.equalTo(btn) }
        
        setupBtn()
    }
    
    public func setupBtn(height: CGFloat = 48, edge: UIEdgeInsets = .zero) {
        btn.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(edge)
            $0.height.equalTo(height)
        }
    }
    
    public func setupBtn(title: String, titleColor: UIColor, bgColor: UIColor, image: UIImage? = nil ){
        self.title = title
        btn.setTitleColorForAllStates(titleColor)
        btn.backgroundColor = bgColor
        if let image = image {
            btn.setImageForAllStates(image)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let rad = btn.bounds.height * 0.5
        btn.cornerRadius = rad
        maskBtn.cornerRadius = rad
    }
}
