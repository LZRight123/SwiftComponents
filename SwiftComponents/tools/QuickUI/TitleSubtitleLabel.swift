//
//  TitleSubtitleLabel.swift
//  dsx
//
//  Created by liangze on 2020/4/13.
//  Copyright © 2020 liangze. All rights reserved.
//

import UIKit
@available(*, deprecated, message: "Use `InfoModel`")
public struct ItemModel {
    public var title = ""
    public var content = " "
    
    public init(title: String = "", content: String = " ") {
        self.title = title
        self.content = content
    }
}

public let placehodlerExchange = "dsx_placeholder_text"
public let placehodlerText = placehodlerExchange + "暂无"
@IBDesignable
open class TitleSubtitleLabel: LZControl {
    public let titleLabel = UILabel(font: .font16, textColor: .hex999999).then{
        $0.setContentHuggingPriority(.required, for: .horizontal)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    public let subtitleLabel = UILabel(font: .font16, textColor: .hex333333, numberOfLines: 0).then {
        $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    public var backgorundView = UIView()
    
    private(set) lazy var stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel], spacing: 0, alignment: .top, distribution: .fill, axis: .horizontal)
    
    private var _arrowView: UIView?
    public var arrowMargin: CGFloat = 0
    public var arrowView: UIView? {
        didSet {
            _arrowView?.removeFromSuperview()
            
            if let arrowView = arrowView  {
                stack.snp.remakeConstraints {
                    $0.left.top.bottom.equalToSuperview()
                }
                
                add(arrowView).snp.makeConstraints {
                    $0.right.equalToSuperview()
                    $0.centerY.equalToSuperview()
                    $0.left.equalTo(stack.snp.right).offset(arrowMargin)
                }
                
            } else {
                add(stack).snp.remakeConstraints {
                    $0.edges.equalToSuperview()
                }
            }
            _arrowView = arrowView
        }
    }
    
    @objc @IBInspectable public var spaceing: CGFloat = 0 {
        didSet {
            stack.spacing = spaceing
            arrowMargin = spaceing
        }
    }
    
    @objc @IBInspectable public var title: String = "" {
        didSet {
            titleLabel.text = title.isEmpty ? " ": title
        }
    }
    @objc @IBInspectable public var subTitle: String = "" {
        didSet {
            subtitleLabel.text = subTitle.isEmpty ? " ": subTitle
            if subTitle.contains(placehodlerExchange) {
                subtitleLabel.text = subTitle.components(separatedBy: placehodlerExchange).last
            }
        }
    }
    
//    private let maskBtn = UIButton()
    
//    open override var isUserInteractionEnabled: Bool {
//        didSet {
//            maskBtn.isUserInteractionEnabled = isUserInteractionEnabled
//        }
//    }
        
    open override func setupUI() {
        isUserInteractionEnabled = false
        backgroundColor = .clear
        backgorundView.isUserInteractionEnabled = false
        stack.isUserInteractionEnabled = false
        
        add(backgorundView).snp.makeConstraints { $0.edges.equalToSuperview() }
        
        add(stack).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
//        add(maskBtn).snp.makeConstraints { $0.edges.equalToSuperview()  }
        
        subtitleLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(titleLabel)
        }
    }
    
//    open override func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
//        maskBtn.addTarget(target, action: action, for: controlEvents)
//    }
    
    public typealias Handle = (UIView, UIStackView) -> Void
    open func setupArrowView(_ arrowView: UIView?, hanlder: Handle?) {
        _arrowView?.removeFromSuperview()
        if let arrowView = arrowView  {
            add(arrowView)
            stack.snp.remakeConstraints {
                $0.left.top.bottom.equalToSuperview()
            }
            
            hanlder?(arrowView, stack)
            
        } else {
            add(stack).snp.remakeConstraints {
                $0.edges.equalToSuperview()
            }
        }
        _arrowView = arrowView
    }
}

