//
//  TitleSubtitleLabel.swift
//  dsx
//
//  Created by liangze on 2020/4/13.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit
struct ItemModel {
    var title = ""
    var content = "0"
}

let placehodlerExchange = "dsx_placeholder_text"
let placehodlerText = placehodlerExchange + "暂无"
@IBDesignable
class TitleSubtitleLabel: LZControl {
    let titleLabel = UILabel(font: .font16, textColor: .hex333333).then{
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    let subtitleLabel = UILabel(font: .font16, textColor: .hex333333, numberOfLines: 0).then {
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    let arrowBtn = UIButton().then{
        $0.isUserInteractionEnabled = false
        $0.setContentHuggingPriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    @objc @IBInspectable var spaceing: CGFloat = 0 {
        didSet {
            guard subtitleLabel.superview != nil else { return }
            
            subtitleLabel.snp.updateConstraints {
                $0.left.equalTo(self.titleLabel.snp.right).offset(spaceing)
            }
        }
    }
    
    @objc @IBInspectable var title: String = "" {
        didSet {
            titleLabel.text = title.isEmpty ? " ": title
        }
    }
    @objc @IBInspectable var subTitle: String = "" {
        didSet {
            subtitleLabel.text = subTitle.isEmpty ? " ": subTitle
            if subTitle.contains(placehodlerExchange) {
                subtitleLabel.text = subTitle.components(separatedBy: placehodlerExchange).last
                subtitleLabel.textColor = .hex999999
            } else {
                subtitleLabel.textColor = .hex333333
            }
        }
    }
    
    var isShowArrow: Bool = false {
        didSet {
            refreshUI()
        }
    }
    
    private func refreshUI() {
        if isShowArrow {
            subtitleLabel.snp.remakeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.left.equalTo(self.titleLabel.snp.right)
            }
            arrowBtn.snp.remakeConstraints {
                $0.centerY.equalTo(subtitleLabel)
                $0.right.equalToSuperview().priority(.required)
                $0.left.equalTo(subtitleLabel.snp.right).offset(12)
                $0.width.height.equalTo(20)
            }
        } else {
            arrowBtn.snp.removeConstraints()
            subtitleLabel.snp.remakeConstraints {
                $0.top.bottom.right.equalToSuperview()
                $0.left.equalTo(self.titleLabel.snp.right)
            }
        }
    }
    
    override func setupUI() {
        isUserInteractionEnabled = false
        backgroundColor = .clear
        add(titleLabel).snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        add(subtitleLabel).snp.makeConstraints {
            $0.top.bottom.right.equalToSuperview()
            $0.left.equalTo(self.titleLabel.snp.right)
        }
        
        add(arrowBtn)
        
        refreshUI()
        
      
    }
}


//MARK: - 上下布局
class TBTitleSubtitleLabel: TitleSubtitleLabel {
    override var intrinsicContentSize: CGSize { .init(width: 54, height: 54) }
    
    override func setupUI() {
        isUserInteractionEnabled = true
        cornerRadius = 2
        backgroundColor = .main
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.font18.bold
        titleLabel.textColor = .hex6A6A6A
        subtitleLabel.font = .font14
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .hex6A6A6A
        
        add(titleLabel).snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
        }
        
        add(subtitleLabel).snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-8)
            $0.centerX.equalToSuperview()
        }
    }
    
    override var subTitle: String {
        didSet {
            if subTitle.contains(placehodlerExchange) {
                subtitleLabel.text = subTitle.components(separatedBy: placehodlerExchange).last
                subtitleLabel.textColor = .hex999999
            } else {
                subtitleLabel.textColor = isSelected ? .white : .hex6A6A6A
            }
        }
    }
    
    override var isSelected: Bool {
        get { super.isSelected }
        set {
            if newValue {
                [titleLabel, subtitleLabel].forEach {
                    $0.textColor = .white
                }
                backgroundColor = .main
            } else {
                [titleLabel, subtitleLabel].forEach {
                    $0.textColor = .hex6A6A6A
                }
                backgroundColor = .white
            }
            super.isSelected = newValue
        }
    }
}
