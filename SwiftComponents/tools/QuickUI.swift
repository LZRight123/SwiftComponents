//
//  QuickUI.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/25.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation


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
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    open func setupUI() {
        
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
    
    
    public convenience init(colors: [UIColor], locations: [CGFloat]? = nil, startPoint: CGPoint, endPoint: CGPoint, type: CAGradientLayerType = .axial) {
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
