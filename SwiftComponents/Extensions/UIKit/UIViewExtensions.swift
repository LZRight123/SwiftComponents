//
//  File.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2019/2/19.
//  Copyright © 2019 com.FBBC.JoinTown. All rights reserved.
//

import UIKit


// MARK: - Initializers
public extension UIView {
    convenience init(color: UIColor){
        self.init()
        self.backgroundColor = color
    }
    
    static func fromNib() -> Self {
        guard let nib = Bundle(for: self).loadNibNamed(nibName, owner: nil, options: nil) else {
            fatalError("Failed loading the nib named \(nibName) for 'NibLoadable' view of type '\(self).'")
        }
        guard let view = nib.first as? Self else {
            fatalError("Did`t find 'NibLoadable' view of type '\(self).' inside '\(nibName).xib .'")
        }
        return view
    }
    
    func setupContentPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        setContentHuggingPriority(priority, for: axis)
        setContentCompressionResistancePriority(priority, for: axis)
    }
    
}


// MARK: - Properties
private var topConstraintKey: Void?
private var bottomConstraintKey: Void?
private var leadingConstraintKey: Void?
private var trailingConstraintKey: Void?
private var widthConstraintKey: Void?
private var heightConstraintKey: Void?

public extension UIView {
    private struct AssociatedKeys {
        static var shadowMotionOffset: UInt8 = 0
        static var motionOffset: UInt8 = 0
    }
    
    static var identifier: String { return String(describing: self) }
    
    static var nibName: String { return String(describing: self) }
    
    static var nib: UINib { return UINib(nibName: nibName, bundle: Bundle(for: self)) }
    
    @objc @IBInspectable var zIndex: CGFloat {
        get {
            return layer.zPosition
        }
        set {
            layer.zPosition = newValue
        }
    }
    @objc @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set(radius) {
            layer.cornerRadius = radius
        }
    }
    
    @objc @IBInspectable var masksToBounds : Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @objc @IBInspectable var borderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set(width) {
            layer.borderWidth = width
        }
    }
    
    @objc @IBInspectable var borderColor : UIColor? {
        get {
            return layer.borderColor as? UIColor? ?? nil
        }
        set(color) {
            layer.borderColor = color?.cgColor
        }
    }
    
    @objc @IBInspectable var shadowColor : UIColor? {
        get {
            return layer.shadowColor as? UIColor? ?? nil
        }
        set(color) {
            layer.shadowColor = color?.cgColor
        }
    }
    
    @objc @IBInspectable var shadowRadius : CGFloat {
        get {
            return layer.shadowRadius
        }
        set(radius) {
            layer.shadowRadius = radius
        }
    }
    
    @objc @IBInspectable var shadowOpacity : Float {
        get {
            return layer.shadowOpacity
        }
        set(opacity) {
            layer.shadowOpacity = opacity
        }
    }
    
    @objc @IBInspectable var shadowOffset : CGSize {
        get {
            return layer.shadowOffset
        }
        set(offset) {
            layer.shadowOffset = offset
        }
    }
    
    @objc @IBInspectable var shadowMotionOffset : CGSize {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.shadowMotionOffset) as? NSValue else {
                return .zero
            }
            
            return value.cgSizeValue
        }
        set(newSize) {
            var currentSize = CGSize.zero
            let currentValue = objc_getAssociatedObject(self, &AssociatedKeys.shadowMotionOffset) as? NSValue
            if currentValue != nil {
                currentSize = currentValue!.cgSizeValue
            }
            
            if currentSize.equalTo(newSize) {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.shadowMotionOffset, NSValue(cgSize: newSize), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            addInterpolatingMotionEffect(keyPath: "layer.shadowOffset.width", effectType: .tiltAlongHorizontalAxis, range: newSize.width)
            addInterpolatingMotionEffect(keyPath: "layer.shadowOffset.height", effectType: .tiltAlongVerticalAxis, range: newSize.height)
        }
    }
    
    @objc @IBInspectable var motionOffset : CGSize {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.motionOffset) as? NSValue else {
                return .zero
            }
            
            return value.cgSizeValue
        }
        set(newSize) {
            var currentSize = CGSize.zero
            let currentValue = objc_getAssociatedObject(self, &AssociatedKeys.motionOffset) as? NSValue
            if currentValue != nil {
                currentSize = currentValue!.cgSizeValue
            }
            
            if currentSize.equalTo(newSize) {
                return
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.motionOffset, NSValue(cgSize: newSize), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            addInterpolatingMotionEffect(keyPath: "center.x", effectType: .tiltAlongHorizontalAxis, range: newSize.width)
            addInterpolatingMotionEffect(keyPath: "center.y", effectType: .tiltAlongVerticalAxis, range: newSize.height)
        }
    }
    
    private func addInterpolatingMotionEffect(keyPath : String, effectType : UIInterpolatingMotionEffect.EffectType, range value : CGFloat) {
        for effect in motionEffects {
            if let interpolatingEffect = effect as? UIInterpolatingMotionEffect {
                if interpolatingEffect.keyPath == keyPath {
                    removeMotionEffect(interpolatingEffect)
                    break
                }
            }
        }
        
        if value == 0 {
            return
        }
        
        let effect = UIInterpolatingMotionEffect(keyPath: keyPath, type: effectType)
        if value < 0 {
            effect.minimumRelativeValue = -(abs(value));
            effect.maximumRelativeValue = abs(value);
        } else {
            effect.minimumRelativeValue = abs(value);
            effect.maximumRelativeValue = -(abs(value));
        }
        addMotionEffect(effect)
    }
    

    var selfViewController: UIViewController? {
        var next = self.next
        while next != nil {
            if let next = next as? UIViewController {
                return next
            }
            next = next?.next
        }
        return nil
    }
    
}


// MARK: - Methods
public extension UIView {
    func addSubviews(_ subViews: UIView...) {
        subViews.forEach(addSubview)
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
   
 
    @discardableResult
    func add<T: UIView>(_ subview: T) -> T {
        addSubview(subview)
        return subview
    }
    
    
    //为 uiview 扩展添加边框功能
    //画线
    private func drawBorder(rect:CGRect,color:UIColor){
        let line = UIBezierPath(rect: rect)
        let lineShape = CAShapeLayer()
        lineShape.path = line.cgPath
        lineShape.fillColor = color.cgColor
        self.layer.addSublayer(lineShape)
    }
    
    func superDesignationView(_ aClass: AnyClass) -> UIResponder? {
        var next = self.next
        while next != nil {
            if let next = next, next.isMember(of: aClass) {
                return next
            }
            next = next?.next
        }
        return nil
    }
    
    @objc func mask(corners: UIRectCorner, radius: CGFloat){
        mask(corners: corners, cornerRdii: CGSize(width: radius, height: radius))
    }
    
    @objc func mask(corners: UIRectCorner, cornerRdii: CGSize){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(0)) {
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRdii)
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    /// EZSwiftExtensions
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    /// EZSwiftExtensions
    func addBorderTop(size: CGFloat, color: UIColor) {
        DispatchQueue.main.async {
            self.addBorderUtility(x: 0, y: 0, width: self.frame.width, height: size, color: color)
        }
    }
    
    //TODO: add to readme
    /// EZSwiftExtensions
    func addBorderTopWithPadding(size: CGFloat, color: UIColor, padding: CGFloat) {
        DispatchQueue.main.async {
            self.addBorderUtility(x: padding, y: 0, width: self.frame.width - padding*2, height: size, color: color)
        }
    }
    
    /// EZSwiftExtensions
    func addBorderBottom(size: CGFloat, color: UIColor) {
        DispatchQueue.main.async {
            self.addBorderUtility(x: 0, y: self.frame.height - size, width: self.frame.width, height: size, color: color)
        }
    }
    
    /// EZSwiftExtensions
    func addBorderLeft(size: CGFloat, color: UIColor) {
        DispatchQueue.main.async {
            self.addBorderUtility(x: 0, y: 0, width: size, height: self.frame.height, color: color)
        }
    }
    
    /// EZSwiftExtensions
    func addBorderRight(size: CGFloat, color: UIColor) {
        DispatchQueue.main.async {
            self.addBorderUtility(x: self.frame.width - size, y: 0, width: size, height: self.frame.height, color: color)
        }
    }
    
    /// EZSwiftExtensions
    fileprivate func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        DispatchQueue.main.async {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: x, y: y, width: width, height: height)
            self.layer.addSublayer(border)
        }
    }
 
    
    func maskCorner() {
        masksToBounds = true
        DispatchQueue.main.async {
            self.cornerRadius = self.height * 0.5
        }
    }
    
    func snapshotImage() -> UIImage? {
        return screenshot
        
        //        if #available(iOS 10.0, *) {
        //            let renderer = UIGraphicsImageRenderer(bounds: bounds)
        //            return renderer.image { layer.render(in: $0.cgContext) }
        //
        //        } else {
        //            UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        //            guard let context = UIGraphicsGetCurrentContext()  else {
        //                return nil
        //            }
        //            layer.render(in: context)
        //            let snap = UIGraphicsGetImageFromCurrentImageContext()
        //            UIGraphicsEndImageContext();
        //            return snap
        //        }
    }
    
    
    /// 画虚线
    //MARK:- 绘制虚线
    func drawDashLine(strokeColor: UIColor, lineWidth: CGFloat = 1, lineLength: Int = 10, lineSpacing: Int = 5, isBottom: Bool = true) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = .round
        
        //每一段虚线长度 和 每两段虚线之间的间隔
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]
        
        let path = CGMutablePath()
        let y = isBottom == true ? self.layer.bounds.height - lineWidth : 0
        path.move(to: CGPoint(x: 0, y: y))
        path.addLine(to: CGPoint(x: self.layer.bounds.width, y: y))
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
}
