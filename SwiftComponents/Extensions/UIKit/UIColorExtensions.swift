//
//  UIColor+Extension.swift
//  LearningSwift
//
//  Created by 梁泽 on 2018/9/14.
//  Copyright © 2018年 梁泽. All rights reserved.
//

import UIKit

public extension UIColor
{
    /// 主色 
    static let main = UIColor.hex01CE95
    static let hex25E5C7 = UIColor(hex: "25E5C7")
    static let hex32C8B1 = #colorLiteral(red: 0.1960784314, green: 0.7843137255, blue: 0.6941176471, alpha: 1)
    static let hex6A6A6A = #colorLiteral(red: 0.4156862745, green: 0.4156862745, blue: 0.4156862745, alpha: 1)
    static let hexE6F5E2 = #colorLiteral(red: 0.9019607843, green: 0.9607843137, blue: 0.8862745098, alpha: 1)
    static let hexF8EAF8 = #colorLiteral(red: 0.9725490196, green: 0.9176470588, blue: 0.9725490196, alpha: 1)
    static let hexE3F3FD = #colorLiteral(red: 0.8901960784, green: 0.9960784314, blue: 0.9921568627, alpha: 1)
    static let hexFFF7DD = #colorLiteral(red: 1, green: 0.968627451, blue: 0.8666666667, alpha: 1)
    static let hexFF7F00 = #colorLiteral(red: 1, green: 0.4980392157, blue: 0, alpha: 1)
    static let hexEA824B = UIColor(hex: "EA824B")
    static let hex88C488 = UIColor(hex: "88C488")
    static let hex8F88C4 = UIColor(hex: "8F88C4")
    static let hex888888 = UIColor(hex: "888888")
    static let hexFEFEFE = UIColor(hex: "FEFEFE")
    static let hexEFEFEF = UIColor(hex: "EFEFEF")

    static let hexE6E6E6 = UIColor(hex: "E6E6E6")
    static let hexFD7531 = #colorLiteral(red: 0.9921568627, green: 0.4588235294, blue: 0.1921568627, alpha: 1)
    static let hex35CAB2 = UIColor(hex: "35CAB2")
    static let hexE2F0EC = #colorLiteral(red: 0.8862745098, green: 0.9411764706, blue: 0.9254901961, alpha: 1)
    static let hexC0C9C6 = #colorLiteral(red: 0.7529411765, green: 0.7882352941, blue: 0.7764705882, alpha: 1)
    static let hexF21D02 = #colorLiteral(red: 0.9490196078, green: 0.1137254902, blue: 0.007843137255, alpha: 1)
    static let hex02A9F1 = #colorLiteral(red: 0.007843137255, green: 0.662745098, blue: 0.9450980392, alpha: 1)
    static let hex09BB07 = #colorLiteral(red: 0.03529411765, green: 0.7333333333, blue: 0.02745098039, alpha: 1)
    static let hexFE880E = UIColor(hex: "FE880E")

    static let hexFFF3DB = #colorLiteral(red: 1, green: 0.9529411765, blue: 0.8588235294, alpha: 1)
    static let hexE9F8F7 = #colorLiteral(red: 0.9137254902, green: 0.9725490196, blue: 0.968627451, alpha: 1)
    static let hex52C4BC = #colorLiteral(red: 0.3215686275, green: 0.768627451, blue: 0.737254902, alpha: 1)
    static let hexFFEDE3 = #colorLiteral(red: 1, green: 0.9294117647, blue: 0.8901960784, alpha: 1)
    static let hexFF4E00 = #colorLiteral(red: 1, green: 0.3058823529, blue: 0, alpha: 1)
    static let hexFFE3E3 = #colorLiteral(red: 1, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
    static let hexFA2D2D = #colorLiteral(red: 0.9803921569, green: 0.1764705882, blue: 0.1764705882, alpha: 1)
    static let hexECECFC = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9882352941, alpha: 1)
    static let hex7A70EB = #colorLiteral(red: 0.4784313725, green: 0.4392156863, blue: 0.9215686275, alpha: 1)
    static let hexE8F1FF = #colorLiteral(red: 0.9098039216, green: 0.9450980392, blue: 1, alpha: 1)
    static let hex2F75E3 = UIColor(hex: "2F75E3")

    // 次要的，比主色淡一些 hexDBEDF9
    static let secondary = UIColor.hex04BDE7

    /// 文字颜色 1 = hex333333; 2 = hex666666; 3 = hex999999
    static let text1 = UIColor.hex333333
    /// 文字颜色 1 = hex333333; 2 = hex666666; 3 = hex999999
    static let text2 = UIColor.hex666666
    /// 文字颜色 1 = hex333333; 2 = hex666666; 3 = hex999999
    static let text3 = UIColor.hex999999

    /// 灰色 1 = E5E5E5
    static let grey1 = UIColor.hexE5E5E5
    /// 边框颜色 1 = #7DAED0(alpha=0.4)
    static let border1 = UIColor.hex04BDE7

    /// 分割线 1 = DADADA
    static let line1 = UIColor.hexE5E5E5
    
    /// 警告色 1 = FF3707
    static let alert1 = UIColor.hexFDEADE

    /// 背景色 backgorundColor = F6F6F6
    static let backgorundColor = UIColor.hexF6F6F6
    /// 图片背景色
    static let imageBackgroundColor = UIColor.hexF5F7FA
    
    //MARK: - 多宝色
    static let hex01CE95 = UIColor(hex: "01CE95")
    static let hexF5F7FA = #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9803921569, alpha: 1)
    static let hex1AB1FC = #colorLiteral(red: 0.1019607843, green: 0.6941176471, blue: 0.9882352941, alpha: 1)
    static let hex1B93CE = UIColor(hex: "1B93CE")
    static let hexFF7D4D = #colorLiteral(red: 1, green: 0.4901960784, blue: 0.3019607843, alpha: 1)
    static let hexFF9F19 = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.09803921569, alpha: 1)
    static let hexFFE7BF = #colorLiteral(red: 1, green: 0.9058823529, blue: 0.7490196078, alpha: 1)
    static let hex703400 = #colorLiteral(red: 0.4392156863, green: 0.2039215686, blue: 0, alpha: 1)
    static let hexF2CE18 = #colorLiteral(red: 0.9490196078, green: 0.8078431373, blue: 0.09411764706, alpha: 1)
    static let hexF2D6A2 = UIColor(hex: "F2D6A2")
    static let hexFFD5CC = UIColor(hex: "FFD5CC")
    static let hexCC2200 = #colorLiteral(red: 0.8, green: 0.1333333333, blue: 0, alpha: 1)
    static let hexFFA900 = #colorLiteral(red: 1, green: 0.662745098, blue: 0, alpha: 1)
    static let hexA37823 = #colorLiteral(red: 0.6392156863, green: 0.4705882353, blue: 0.137254902, alpha: 1)
    static let hexAB7100 = #colorLiteral(red: 0.6705882353, green: 0.4431372549, blue: 0, alpha: 1)
    static let hexFFA800 = #colorLiteral(red: 1, green: 0.6588235294, blue: 0, alpha: 1)
    static let hexFFE14D = #colorLiteral(red: 1, green: 0.8823529412, blue: 0.3019607843, alpha: 1)
    static let hexFF0000 = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    static let hexFFECE6 = #colorLiteral(red: 1, green: 0.9254901961, blue: 0.9019607843, alpha: 1)
    static let hex11B688 = UIColor(hex: "11B688")
    static let hexFC0000 = UIColor(hex: "FC0000")
    static let hex181818 = UIColor(hex: "181818")
    static let hexFBE7E8 = UIColor(hex: "FBE7E8")
    static let hexF5F5F5 = UIColor(hex: "F5F5F5")
    
    
    //MARK:- 常用色
    static let hex3598DB = #colorLiteral(red: 0.2078431373, green: 0.5960784314, blue: 0.8588235294, alpha: 1)
    static let hexDBEDF9 = #colorLiteral(red: 0.8588235294, green: 0.9294117647, blue: 0.9764705882, alpha: 1)
    static let hexFF6F21 = #colorLiteral(red: 1, green: 0.4352941176, blue: 0.1294117647, alpha: 1)
    static let hex545a63 = #colorLiteral(red: 0.3294117647, green: 0.3529411765, blue: 0.3882352941, alpha: 1)
    static let hexFA0200 = #colorLiteral(red: 0.9803921569, green: 0.007843137255, blue: 0, alpha: 1)
    static let hexF6F6F6 = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    static let hexE5E5E5 = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    //MARK:- 字体色
    static let hex000000 = UIColor.black
    static let hex222222 = #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    static let hex333333 = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let hex444444 = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    static let hex666666 = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
    static let hex999999 = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    static let hexBEBEBE = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
    //MARK:- ????
    static let hexEEEEEE = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
    static let hexCCCCCC = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
    static let hex050505 = #colorLiteral(red: 0.01960784314, green: 0.01960784314, blue: 0.01960784314, alpha: 1)
    static let hexF4F4F4 = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    static let hexFDEADE = #colorLiteral(red: 0.9921568627, green: 0.9176470588, blue: 0.8705882353, alpha: 1)
    static let hex04BDE7 = #colorLiteral(red: 0.01568627451, green: 0.7411764706, blue: 0.9058823529, alpha: 1)
    static let hexFFE3D9 = #colorLiteral(red: 1, green: 0.8901960784, blue: 0.8509803922, alpha: 1)
    // MARK: - 单聊录音
    static let hex434343 = #colorLiteral(red: 0.262745098, green: 0.262745098, blue: 0.262745098, alpha: 1)
    static let hexEBEBEB = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
    static let hexEC2B24 = #colorLiteral(red: 0.9254901961, green: 0.168627451, blue: 0.1411764706, alpha: 1)
  
    static var random: UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let ri = String(format: "%2X", Int(r * 255))
        let gi = String(format: "%2X", Int(r * 255))
        let bi = String(format: "%2X", Int(r * 255))
        //        let ai = String(format: "%2X", Int(r * 255))
        return "#\(ri.count == 1 ? "0" + ri : ri)\(gi.count == 1 ? "0"+gi : gi)\(bi.count == 1 ? "0" + bi : bi)"
    }

    
    convenience init(hex: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex:   String = hex
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

/// 适配lu管家
public extension UIColor {
    convenience init?(hexString: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex:   String = hexString
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
