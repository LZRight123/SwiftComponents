//
//  UIFontExtensions.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

public extension UIFont {
    enum FontName: String, CaseIterable {
        case Avenir_Regular = "AvenirNext-Regular"
        case Avenir_Medium = "AvenirNext-Medium"
        case Avenir_DemiBold = "AvenirNext-DemiBold"
        case PF_Light = "PingFangSC-Light"
        case PF_Regular = "PingFangSC-Regular"
        case PF_Semibold = "PingFangSC-Semibold"
        case PF_Medium = "PingFangSC-Medium"
        case PF_Thin = "PingFangSC-Thin"
        case HT_Light = "Helvetica-Light"
        case HT = "Helvetica"
        case DIN_Bold = "DINAlternate-Bold" //部分数字用
    }
    
    var PF_Light: UIFont { to(.PF_Light) }
    var PF_Regular: UIFont { to(.PF_Regular) }
    var PF_Semibold: UIFont { to(.PF_Semibold) }
    var PF_Medium: UIFont { to(.PF_Medium) }
    var PF_Thin: UIFont { to(.PF_Thin) }

    private static let normalFont = UIFont.systemFont(ofSize: UIFont.labelFontSize)
    static let font7 = UIFont.normalFont.withSize(7).autoScaled()
    static let font8 = UIFont.normalFont.withSize(8).autoScaled()
    static let font9 = UIFont.normalFont.withSize(9).autoScaled()
    static let font10 = UIFont.normalFont.withSize(10).autoScaled()
    static let font11 = UIFont.normalFont.withSize(11).autoScaled()
    static let font12 = UIFont.normalFont.withSize(12).autoScaled()
    static let font13 = UIFont.normalFont.withSize(13).autoScaled()
    static let font14 = UIFont.normalFont.withSize(14).autoScaled()
    static let font15 = UIFont.normalFont.withSize(15).autoScaled()
    static let font16 = UIFont.normalFont.withSize(16).autoScaled()
    static let font17 = UIFont.normalFont.withSize(17).autoScaled()
    static let font18 = UIFont.normalFont.withSize(18).autoScaled()
    static let font19 = UIFont.normalFont.withSize(19).autoScaled()
    static let font20 = UIFont.normalFont.withSize(20).autoScaled()
    static let font21 = UIFont.normalFont.withSize(21).autoScaled()
    static let font22 = UIFont.normalFont.withSize(22).autoScaled()
    static let font23 = UIFont.normalFont.withSize(23).autoScaled()
    static let font24 = UIFont.normalFont.withSize(24).autoScaled()
    static let font25 = UIFont.normalFont.withSize(25).autoScaled()
    static let font26 = UIFont.normalFont.withSize(26).autoScaled()
    static let font27 = UIFont.normalFont.withSize(27).autoScaled()
    static let font28 = UIFont.normalFont.withSize(28).autoScaled()
    static let font29 = UIFont.normalFont.withSize(29).autoScaled()
    static let font30 = UIFont.normalFont.withSize(30).autoScaled()
    static let font31 = UIFont.normalFont.withSize(31).autoScaled()
    static let font32 = UIFont.normalFont.withSize(32).autoScaled()
    static let font33 = UIFont.normalFont.withSize(33).autoScaled()
    static let font34 = UIFont.normalFont.withSize(34).autoScaled()
    static let font35 = UIFont.normalFont.withSize(35).autoScaled()
    static let font45 = UIFont.normalFont.withSize(45).autoScaled()

    static let font50 = UIFont.normalFont.withSize(45).autoScaled()

    private func autoScaled() -> UIFont {
//        if #available(iOS 11.0, *) {
//            return UIFontMetrics.default.scaledFont(for: self)
//        } else {
            return self
//        }
    }
    
    fileprivate func to(_ fontName: FontName) -> UIFont {
        guard let font = UIFont(name: fontName.rawValue, size: self.pointSize) else {
            return self
        }
        return font
    }
}
