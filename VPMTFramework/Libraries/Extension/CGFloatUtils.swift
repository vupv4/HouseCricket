//
//  CGFloatUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension CGFloat {
    /// Return the central value of CGFloat.
    public var center: CGFloat { return (self / 2) }
    
    /// SwiftExtensions
    public func toRadians() -> CGFloat {
        return (CGFloat (M_PI) * self) / 180.0
    }
    
    /// SwiftExtensions
    public func degreesToRadians() -> CGFloat {
        return toRadians()
    }
    
    /// SwiftExtensions
    public mutating func toRadiansInPlace() {
        self = (CGFloat (M_PI) * self) / 180.0
    }
    
    /// Converts angle degrees to radians.
    public func degreesToRadians (angle: CGFloat) -> CGFloat {
        return (CGFloat (M_PI) * angle) / 180.0
    }
}
