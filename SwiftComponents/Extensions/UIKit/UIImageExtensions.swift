//
//  UIImageExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit)
import UIKit


// MARK: - Methods
public extension UIImage {
    func scaled(toSize size:CGSize) -> UIImage? {
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(size);
        self.draw(in: CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
        // 返回新的改变大小后的图片
        return image;
    }
    
    
    func grayImage() -> UIImage? {
        
        //        获得宽度和高度数值
        let width = Int(size.width)
        let height = Int(size.height)
        
        //        创建灰度色彩空间对象，各种设备对待颜色的方式都不一样，颜色必须有一个相关的色彩空间
        let spaceRef = CGColorSpaceCreateDeviceGray()
        //        参数data指向渲染的绘制内存的地址，bitsOerComponent表示内存中像素的每个组件的位数,bytesPerRow表示每一行在内存中占的比特数，space表示使用的颜色空间，bitmapInfo表示是否包含alpha通道
        //        CGBitmapInfo().rawValue
        guard let context = CGContext(data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: spaceRef, bitmapInfo: CGBitmapInfo().rawValue) else {
            return nil
        }
        //        然后创建一个和原视图同样尺寸的空间
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        //        在灰度上下文中画入图片
        //        context.alpha
        guard let cgImage = cgImage else {
            return nil
        }
        context.draw(cgImage, in: rect)
        //        从上下文中获取并生成专为灰度的图片
        
        if let cgImage = context.makeImage() {
            let grayImage = UIImage.init(cgImage: cgImage)
            return grayImage
        }
        return nil
    }
}


#endif
