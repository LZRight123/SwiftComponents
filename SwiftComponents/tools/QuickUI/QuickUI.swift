//
//  QuickUI.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/25.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation
import UIKit


import ObjectiveC
//https://nshipster.com/ibinspectable-ibdesignable/
@IBDesignable
class IBUIView: UIView {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable
class IBUIControl: UIControl {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable
class IBUIButton: UIButton {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable
class IBUIImageView: UIImageView {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable
class IBUILabel: UILabel {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
//
@IBDesignable
class IBUITextField: UITextField {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}

@IBDesignable
class IBUICollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}


//MARK: - 直接出setupUI
@IBDesignable
open class LZView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    open func setupUI() {
        
    }
}

open class LZControl: UIControl {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
   public  override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    open func setupUI() {
        
    }
}

open class LZTableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        selectionStyle = .none
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        selectionStyle = .none
    }
    
    open func setupUI() {
        
    }
}


open class LZStackCell: LZTableViewCell {
    public let stack = UIStackView(arrangedSubviews: [], spacing: 9, alignment: .fill, distribution: .fill, axis: .vertical)
    
    open override func setupUI() {
        selectionStyle = .none
                
        contentView.add(stack).snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.equalToSuperview().offset(13)
            $0.top.equalToSuperview().offset(14)
        }
    }

}



public extension UICollectionViewCell {
    /// This is a workaround method for self sizing collection view cells which stopped working for iOS 12
    
    func setupSelfSizingForiOS12() {
        if #available(iOS 12, *) {
            contentView.snp.remakeConstraints { $0.edges.equalToSuperview() }
        }
    }
}

open class LZCollectionViewCell: UICollectionViewCell {
    public let lineView = UIView(color: .line1)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelfSizingForiOS12()
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSelfSizingForiOS12()
        setupUI()
    }
    
    open func setupUI() {
           
    }
    
    open func showLine(_ isShow: Bool) {
        lineView.isHidden = !isShow
    }
}

open class LZCollectionReusableView: UICollectionReusableView {
    public let contentView = UIView()
    public var edgeInsets = UIEdgeInsets.zero {
        didSet {
            contentView.snp.remakeConstraints {
                $0.edges.equalToSuperview().inset(edgeInsets)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        __configUI()
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func __configUI() {
        add(contentView)
        edgeInsets = .zero
    }
    
    open func setupUI() {
           
    }
}


//MARK: - fix ios12 bug https://blog.csdn.net/weixin_33939380/article/details/88016446
// 不用这个
open class AutoLayoutCollectionView: UICollectionView {
    
    private var shouldInvalidateLayout = false
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        if shouldInvalidateLayout {
            collectionViewLayout.invalidateLayout()
            shouldInvalidateLayout = false
        }
    }
    
    open override func reloadData() {
        shouldInvalidateLayout = true
//        collectionViewLayout.invalidateLayout()
        
        super.reloadData()
    }
}




open class GradientView: UIView {
    public var grLayer = CAGradientLayer()
    
    
    public convenience init(colors: [UIColor], locations: [CGFloat]? = nil, startPoint: CGPoint = .zero, endPoint: CGPoint = .init(x: 1, y: 1), type: CAGradientLayerType = .axial) {
        self.init()

        grLayer.colors =  colors.map { $0.cgColor }
        grLayer.locations = locations?.map { NSNumber(value: Double($0)) }
        grLayer.startPoint = startPoint
        grLayer.endPoint = endPoint
        grLayer.type = type
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        masksToBounds = true
        layer.addSublayer(grLayer)
        grLayer.frame = bounds
    }
    
}




//MARK: - 封装StackView
open class LZVStackView: UIStackView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 3
        self.alignment = .center
        self.distribution = .fill
        setupUI()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    open func setupUI() {
        
    }
}

open class LZHStackView: UIStackView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.spacing = 3
        self.alignment = .center
        self.distribution = .fill
        setupUI()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupUI()
    }
    
    open func setupUI() {
        
    }
}

open class LZItemStackView: LZVStackView {
    public let imageView = UIImageView()
    public let titleLabel = UILabel(font:  .font15, textColor: .hex666666, text: nil, textAlignment: .center)
    
    public convenience init(image: UIImage?, text: String?) {
        self.init()
        imageView.image = image
        titleLabel.text = text
        spacing = 14
    }
    
    open override func setupUI() {
        super.setupUI()
        
        addArrangedSubviews([imageView, titleLabel])
    }
}


open class LZHItemStackView: LZHStackView {
    public let imageView = UIImageView()
    public let titleLabel = UILabel(font:  .font15, textColor: .hex666666, text: nil, textAlignment: .center)
    
    public convenience init(image: UIImage?, text: String?) {
        self.init()
        setup(image: image, text: text)
        spacing = 14
    }
    
    open override func setupUI() {
        super.setupUI()
        
        addArrangedSubviews([titleLabel, imageView])
    }
    
    public func setup(image: UIImage?, text: String?) {
        imageView.image = image
        titleLabel.text = text
    }
}







open class LZStackVC: UIViewController {
    public let stack = UIStackView(arrangedSubviews: [], spacing: 0, alignment: .fill, distribution: .fill, axis: .vertical)
    
    public let safeBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.snp.makeConstraints {
            $0.height.equalTo(SafeBottomArea)
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.add(stack).snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


open class LZTextFiled: UITextField {
    
//    open override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        if let leftView = leftView {
//            return .init(origin: .zero, size: .init(width: leftView.frame.width, height: leftView.frame.height))
//        } else {
//            return .zero
//        }
//    }

}
