//
//  LineCell.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/8/11.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit

open class LineCell: LZTableViewCell {
    public let lineView = UIView(color: .clear)
    
    open var leftPadding: CGFloat = 13 {
        didSet {
            guard lineView.superview != nil else { return }
            
            lineView.snp.updateConstraints { $0.left.equalToSuperview().offset(leftPadding) }
        }
    }
    open var lineHeight: CGFloat = 0.5 {
        didSet {
            guard lineView.superview != nil else { return }
            
            lineView.snp.updateConstraints { $0.height.equalToSuperview().offset(lineHeight) }
        }
    }
    
    
    open override func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        add(lineView).snp.makeConstraints {
            $0.bottom.right.equalToSuperview()
            $0.left.equalToSuperview().offset(leftPadding)
            $0.height.equalToSuperview().offset(lineHeight)
        }
    }
}


//MARK: - CollectionView 用
open class LineCollectionCell: LZCollectionViewCell {

    open var leftPadding: CGFloat = 13 {
        didSet {
            guard lineView.superview != nil else { return }
            
            lineView.snp.updateConstraints { $0.left.equalToSuperview().offset(leftPadding) }
        }
    }
    open var lineHeight: CGFloat = 0.5 {
        didSet {
            guard lineView.superview != nil else { return }
            
            lineView.snp.updateConstraints { $0.height.equalToSuperview().offset(lineHeight) }
        }
    }
    
    
    open override func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(ScreenWidth)
        }
        
        add(lineView).snp.makeConstraints {
            $0.bottom.right.equalToSuperview()
            $0.left.equalToSuperview().offset(leftPadding)
            $0.height.equalToSuperview().offset(lineHeight)
        }
    }
}



