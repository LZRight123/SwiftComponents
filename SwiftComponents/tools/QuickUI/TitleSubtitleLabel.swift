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

//public let placehodlerExchange = "dsx_placeholder_text"
//public let placehodlerText = placehodlerExchange + "暂无"
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
    
    public lazy var stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel], spacing: 0, alignment: .top, distribution: .fill, axis: .horizontal)
    
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
    
    @objc @IBInspectable public var title: String = " " {
        didSet {
            titleLabel.text = title.isEmpty ? " ": title
        }
    }
    @objc @IBInspectable public var subTitle: String = " " {
        didSet {
            subtitleLabel.text = subTitle.isEmpty ? " ": subTitle
        }
    }
    
    open override var tintColor: UIColor! {
        didSet {
            titleLabel.textColor = tintColor
            subtitleLabel.textColor = tintColor
        }
    }
    
    open var font: UIFont! {
        didSet {
            titleLabel.font = font
            subtitleLabel.font = font
        }
    }
    
    @IBInspectable open var titleFont: UIFont = .font11 { didSet { titleLabel.font = titleFont } }
    @IBInspectable open var subtitleFont: UIFont = .font11 { didSet { subtitleLabel.font = subtitleFont } }
    @IBInspectable open var titleColor: UIColor? { didSet { titleLabel.textColor = titleColor } }
    @IBInspectable open var subtitleColor: UIColor? { didSet { subtitleLabel.textColor = subtitleColor } }
        
    open override func setupUI() {
        isUserInteractionEnabled = false
        backgroundColor = .clear
        backgorundView.isUserInteractionEnabled = false
        stack.isUserInteractionEnabled = false
        
        add(backgorundView).snp.makeConstraints { $0.edges.equalToSuperview() }
        
        add(stack).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
                
        subtitleLabel.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(titleLabel)
        }
    }
    
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




//MARK: - 上下结构的
@IBDesignable
open class TBTitleSubtitleLabel: LZControl {
    public let titleLabel = UILabel(font: .font11, textColor: .hex666666, text: "标题")
    public let subtitleLabel = UILabel(font: .font9, textColor: .hex999999, text: "请输入", numberOfLines: 0)
    public lazy var stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel], spacing: spacing, alignment: .leading, distribution: .fill, axis: .vertical).then {
        $0.isUserInteractionEnabled = false
    }
    
    open override var tintColor: UIColor! {
        didSet {
            titleLabel.textColor = tintColor
            subtitleLabel.textColor = tintColor
        }
    }
    
    @IBInspectable
    open var font: UIFont = .font11 {
        didSet {
            titleLabel.font = font
            subtitleLabel.font = font
        }
    }
    
    @IBInspectable open var titleFont: UIFont = .font11 { didSet { titleLabel.font = titleFont } }
    @IBInspectable open var subtitleFont: UIFont = .font11 { didSet { subtitleLabel.font = subtitleFont } }
    @IBInspectable open var titleColor: UIColor? { didSet { titleLabel.textColor = titleColor } }
    @IBInspectable open var subtitleColor: UIColor? { didSet { subtitleLabel.textColor = subtitleColor } }
    @IBInspectable open var title: String? { didSet { titleLabel.text = title } }
    @IBInspectable open var subtitle: String? { didSet { subtitleLabel.text = subtitle } }
    
    @IBInspectable open var spacing: CGFloat = 3 {
        didSet { stack.spacing = spacing }
    }
    
    
    open override func setupUI() {
        add(stack).snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}


//MARK: - 应该这样定义
/*
 @IBDesignable
 class TitleSubtitleLabel: LZView {
     let titleLabel = UILabel(font: .font16, textColor: .hex999999).then{
         $0.setContentHuggingPriority(.required, for: .horizontal)
         $0.setContentCompressionResistancePriority(.required, for: .horizontal)
     }
     
      let subtitleLabel = UILabel(font: .font16, textColor: .hex333333, numberOfLines: 0).then {
         $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
         $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
     }
     
     
     lazy var stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel], spacing: 0, alignment: .top, distribution: .fill, axis: .horizontal)
     
     
     @objc @IBInspectable public var spaceing: CGFloat = 0 {
         didSet {
             stack.spacing = spaceing
         }
     }
     
     @objc @IBInspectable public var title: String = " " {
         didSet {
             titleLabel.text = title.isEmpty ? " ": title
         }
     }
     @objc @IBInspectable public var subTitle: String = " " {
         didSet {
             subtitleLabel.text = subTitle.isEmpty ? " ": subTitle
         }
     }
     
     override var tintColor: UIColor! {
         didSet {
             titleLabel.textColor = tintColor
             subtitleLabel.textColor = tintColor
         }
     }
     
     var font: UIFont! {
         didSet {
             titleLabel.font = font
             subtitleLabel.font = font
         }
     }
     
     @IBInspectable open var titleFont: UIFont = .font11 { didSet { titleLabel.font = titleFont } }
     @IBInspectable open var subtitleFont: UIFont = .font11 { didSet { subtitleLabel.font = subtitleFont } }
     @IBInspectable open var titleColor: UIColor? { didSet { titleLabel.textColor = titleColor } }
     @IBInspectable open var subtitleColor: UIColor? { didSet { subtitleLabel.textColor = subtitleColor } }
         
     override func setupUI() {
         backgroundColor = .clear
         
         
         add(stack).snp.makeConstraints {
             $0.edges.equalToSuperview()
         }
                 
         subtitleLabel.snp.makeConstraints {
             $0.height.greaterThanOrEqualTo(titleLabel)
         }
         

        
     }

 }
 */
