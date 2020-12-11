//
//  LZToolBar.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/23.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

@IBDesignable
open class LZToolBar: LZControl {
    private var effectView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.isHidden = true
        return view
    }()
    public let backgroundImageView = UIImageView()
    
    public let safeAreaView = UIImageView()
    public var didTouchToolbar: (() -> Void)?
    
    
    public var gradientLayer = CAGradientLayer(colors: [UIColor.black.withAlphaComponent(0.3), UIColor.black.withAlphaComponent(0.7)], locations: [0, 1], startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 1), type: .axial)
    
    public override var backgroundColor: UIColor?  {
        didSet{
            backgroundImageView.backgroundColor = backgroundColor
        }
    }
    
    @IBInspectable public var translucent = false {
        didSet{
            effectView.isHidden = !translucent
        }
    }
    
    @IBInspectable public var backgroundImage: UIImage? {
        didSet{
            backgroundImageView.image = backgroundImage
        }
    }
    
    @IBInspectable public var effectSyle = UIBlurEffect.Style.extraLight {
        didSet{
            effectView.effect = nil
            effectView.effect = UIBlurEffect(style: effectSyle)
        }
    }
  
    open override func setupUI() {
        gradientLayer.isHidden = true
        layer.insertSublayer(gradientLayer, at: 0)
        insertSubview(safeAreaView, at: 0)
        insertSubview(effectView, at: 0)
        insertSubview(backgroundImageView, at: 0)
        
        backgroundImageView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(SafeBottomArea)
        }
        
        safeAreaView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.snp.bottom)
            make.height.equalTo(SafeBottomArea)
        }
        
        effectView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self.backgroundImageView)
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = .init(x: 0, y: 0, width: bounds.width, height: bounds.height + SafeBottomArea)
    }
}

//MARK: - 交互
public extension LZToolBar {
     override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var touchBound = bounds
        touchBound.size.height = bounds.height + 34.0
        return touchBound.contains(point)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let block = self.didTouchToolbar {
            block()
        }
    }
}
