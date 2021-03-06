//
//  CALayerExtensions.swift
//  JadeSocial
//
//  Created by liangze on 2020/4/5.
//  Copyright © 2020 Rick. All rights reserved.
//

import UIKit

public extension CALayer {
    convenience init(color: UIColor = .white) {
        self.init()
        self.backgroundColor = color.cgColor
    }
}


public extension CAGradientLayer {

    /// SwifterSwift: Creates a CAGradientLayer with the specified colors, location, startPoint, endPoint, and type.
    /// - Parameter colors: An array of colors defining the color of each gradient stop
    /// - Parameter locations: An array of NSNumber defining the location of each
    ///                gradient stop as a value in the range [0,1]. The values must be
    ///                monotonically increasing. If a nil array is given, the stops are
    ///                assumed to spread uniformly across the [0,1] range. When rendered,
    ///                the colors are mapped to the output colorspace before being
    ///                interpolated. (default is nil)
    /// - Parameter startPoint: start point corresponds to the first gradient stop (I.e. [0,0] is the bottom-corner of the layer, [1,1] is the top-right corner.)
    /// - Parameter endPoint: end point corresponds to the last gradient stop
    /// - Parameter type: The kind of gradient that will be drawn. Currently, the only allowed values are `axial' (the default value), `radial', and `conic'.
    convenience init(colors: [UIColor], locations: [CGFloat]? = nil, startPoint: CGPoint = .zero, endPoint: CGPoint = .init(x: 1, y: 1), type: CAGradientLayerType = .axial)  {
        self.init()
        self.colors =  colors.map { $0.cgColor }
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }

}
