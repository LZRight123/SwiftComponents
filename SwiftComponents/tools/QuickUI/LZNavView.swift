//
//  LZNavView.swift
//  dsx
//
//  Created by liangze on 2020/4/12.
//  Copyright © 2020 liangze. All rights reserved.
// 

import UIKit


open class LZNavView: UIView {
    public let contentView = UIView(color: .clear)
    public let titleLabel = UILabel(font: .font18, textColor: .white, textAlignment: .center).then {
        $0.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        $0.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
    }
    public let leftStack = UIStackView(arrangedSubviews: [], spacing: 4, alignment: .center, distribution: .fill, axis: .horizontal)
    public let rightStack = UIStackView(arrangedSubviews: [], spacing: 4, alignment: .center, distribution: .fill, axis: .horizontal)
    public var leftMargin: CGFloat = 0
    public var rightMargin: CGFloat = 0
    
    open override var intrinsicContentSize: CGSize { .init(width: ScreenWidth, height: StatusBarH + NavBarH) }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    open func setupUI() {
        backgroundColor = .clear
        contentView.masksToBounds = true
        add(contentView).snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(NavBarH)
        }
        
        contentView.addSubviews(leftStack, rightStack)
        
        leftStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(leftMargin)
        }
        
        rightStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-leftMargin)
        }
        
        contentView.add(titleLabel).snp.makeConstraints {
            $0.center.bottom.equalToSuperview()
            $0.left.greaterThanOrEqualTo(leftStack.snp.right).offset(5)
            $0.right.lessThanOrEqualTo(rightStack.snp.left).offset(-5)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        leftStack.snp.updateConstraints {
            $0.left.equalToSuperview().offset(leftMargin)
        }
        
        rightStack.snp.updateConstraints {
            $0.right.equalToSuperview().offset(-leftMargin)
        }
    }
    
}


open class LZNavTitleView: LZNavView {
    open override var intrinsicContentSize: CGSize { .init(width: ScreenWidth * 0.6, height: 30) }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let touchBound = CGRect(x: -ScreenWidth, y: 0, width: ScreenWidth * 2, height: NavBarH)
        return touchBound.contains(point)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.snp.remakeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(ScreenWidth)
            $0.height.equalTo(NavBarH)
        }
    }

}
