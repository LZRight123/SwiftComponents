//
//  InfoCell.swift
//  dsx
//
//  Created by liangze on 2020/4/13.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit


protocol InfoProtocol {
    var key: String { get set }
    var value: String { get set }
}

struct InfoModel: InfoProtocol {
    var key = ""
    var value = ""
}




class InfoCell: LZTableViewCell {
    let stack = UIStackView(arrangedSubviews: [], spacing: 10, alignment: .leading, distribution: .fill, axis: .vertical)
    private let lineView = UIView(color: .line1)
    
    override func setupUI() {
        contentView.add(stack).snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().offset(116)
            $0.top.equalToSuperview().offset(16)
        }
        
        contentView.add(lineView).snp.makeConstraints {
            $0.bottom.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(13)
            $0.height.equalTo(1)
        }
        
        showLine(false)
    }
    
    func showLine(_ isShow: Bool) {
        lineView.isHidden = !isShow
    }
    
    func addInfos(_ infos: [InfoProtocol]) {
        stack.removeArrangedSubviews()
        stack.removeSubviews()
        
        let subViews = infos.map { info -> TitleSubtitleLabel in
            let itemView = TitleSubtitleLabel()
            itemView.titleLabel.textColor = .hex999999
            itemView.titleLabel.font = .font12
            itemView.subtitleLabel.textColor = .hex333333
            itemView.subtitleLabel.font = .font12
            itemView.titleLabel.snp.remakeConstraints {
                $0.left.top.equalToSuperview()
                $0.width.equalTo(60)
            }
            
            
            itemView.title = info.key
            itemView.subTitle = info.value
            return itemView
        }
        
        stack.addArrangedSubviews(subViews)
    }
}
