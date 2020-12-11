//
//  CardCell.swift
//  SwiftComponents
//
//  Created by 梁泽 on 2020/11/17.
//

import UIKit

open class CardCell: LZTableViewCell {
    // 左右间隙
    open var padding: CGFloat = 12
    
    open var corners: UIRectCorner = []
    
    open var radius: CGFloat = 0
    
    open override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue
            frame.origin.x += padding
            frame.size.width -= 2 * padding
            super.frame = frame
        }
    }
    
    open override func setupUI() {
        layer.mask = CAShapeLayer()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateMask(for: bounds)
    }
    
    
   
    
    func updateMask(for bounds: CGRect) {
        (layer.mask as? CAShapeLayer)?.path =
            UIBezierPath(roundedRect: bounds,
                         byRoundingCorners: corners,
                         cornerRadii: CGSize(width: radius, height: radius)).cgPath

      }
  
}
