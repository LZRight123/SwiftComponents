//
//  ProductDetailScoreCell.swift
//  SwiftComponentsDemo
//
//  Created by liangze on 2020/7/28.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit

class ProductDetailScoreCell: LZCollectionViewCell {
    let stack = UIStackView(arrangedSubviews: [], spacing: 10, alignment: .top, distribution: .fill)
    
    override func setupUI() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(ScreenWidth)
        }
        
        contentView.add(stack).snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.left.equalToSuperview().offset(16)
        }
        
        let label = buildTag()
        label.titleLabel.text = "几分"
        label.subTitle = "sfsfsfsfs"
        
        let label2 = buildTag()
        label2.titleLabel.text = "几分2"
        label2.subtitleLabel.attributedText = NSMutableAttributedString.build(fullText: "本商品最多可消耗300", subText: "300", subAttri: [NSAttributedString.Key.foregroundColor : UIColor.hexFC0000])
        
        stack.addArrangedSubviews([label, label2])
    }
    
    private func buildTag() -> TitleSubtitleLabel {
        return TitleSubtitleLabel().then {
            $0.spaceing = 12
            $0.titleLabel.font = .font12
            $0.titleLabel.textColor = .white
            $0.titleLabel.textAlignment = .center
            $0.subtitleLabel.font = .font12
            $0.subtitleLabel.textColor = .init(hex: "181818")


            $0.titleLabel.snp.remakeConstraints {
                $0.left.top.equalToSuperview()
                $0.width.equalTo(50)
                $0.height.equalTo(17)
            }
            
            let gr = GradientView(colors: [.init(hex: "FBB567"), .init(hex: "FE880E")], startPoint: .zero, endPoint: .init(x: 1, y: 1)).then {
                $0.cornerRadius = 4
            }
            $0.insertSubview(gr, belowSubview: $0.titleLabel)
            
            gr.snp.makeConstraints{
                $0.left.top.equalToSuperview()
                $0.width.equalTo(50)
                $0.height.equalTo(17)
            }
                            

            
            $0.titleLabel.cornerRadius = 3
            $0.titleLabel.masksToBounds = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
