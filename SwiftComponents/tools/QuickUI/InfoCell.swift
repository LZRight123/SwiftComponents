//
//  InfoCell.swift
//  dsx
//
//  Created by liangze on 2020/4/13.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit


public protocol InfoProtocol {
    var key: String { get set }
    var value: String { get set }
}

public struct InfoModel: InfoProtocol {
    public var key = ""
    public var value = ""
    
    public init(key: String = "", value: String = " ") {
        self.key = key
        self.value = value
    }
}


open class InfoCell: LZTableViewCell {
    public let stack = UIStackView(arrangedSubviews: [], spacing: 10, alignment: .fill, distribution: .fill, axis: .vertical)
    public let lineView = UIView(color: .line1)
    
    open override func setupUI() {
        contentView.add(stack).snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(13)
        }
        
        contentView.add(lineView).snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(13)
            $0.height.equalTo(1)
        }
        
        showLine(false)
    }
    
    public func showLine(_ isShow: Bool) {
        lineView.isHidden = !isShow
    }
    
    open func addInfos(_ infos: [InfoProtocol]) {
        stack.removeArrangedSubviews()
        stack.removeSubviews()
        
        let subViews = infos.map { info -> TitleSubtitleLabel in
            let itemView = TitleSubtitleLabel()
            itemView.titleLabel.textColor = .hex999999
            itemView.titleLabel.font = .font13
            itemView.subtitleLabel.textColor = .hex333333
            itemView.subtitleLabel.font = .font13
            itemView.titleLabel.snp.remakeConstraints {
                $0.width.greaterThanOrEqualTo(70)
            }
            
            
            itemView.title = info.key
            itemView.subTitle = info.value
            return itemView
        }
        
        stack.addArrangedSubviews(subViews)
    }
}
