//
//  WrapBtn.swift
//  SwiftComponents
//
//  Created by 梁泽 on 2021/3/9.
//

import UIKit
import SwifterSwift

open class WrapBtn: LZView {
    private let shadowView = UIView(color: .white)
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
        add(shadowView)
        add(btn).snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        add(maskBtn)
        
        shadowView.snp.makeConstraints { $0.edges.equalTo(btn) }
        [shadowView , maskBtn].forEach {
            $0.snp.makeConstraints { $0.edges.equalTo(btn) }
        }
        
//        shadowView.layer.shadowColor = UIColor(hex: "#44CC777A").cgColor
//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        shadowView.layer.shadowOpacity = 1
//        shadowView.layer.shadowRadius = 8
        setupBtn()
    }
    
    public func setupBtn(height: CGFloat = 48, edge: UIEdgeInsets = .init(top: 18, left: 19, bottom: 18, right: 19)) {
        btn.snp.remakeConstraints {
            $0.edges.equalToSuperview().inset(edge)
            $0.height.equalTo(height)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let rad = btn.bounds.height * 0.5
        btn.cornerRadius = rad
        shadowView.layer.cornerRadius = rad
        maskBtn.cornerRadius = rad
    }
}
