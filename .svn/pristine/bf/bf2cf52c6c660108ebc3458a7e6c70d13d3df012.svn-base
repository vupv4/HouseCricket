//
//  IntUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension Int {
    ///Checks if the integer is even.
    public var isEven: Bool     { return (self % 2 == 0) }
    
    ///Checks if the integer is odd.
    public var isOdd: Bool      { return (self % 2 != 0) }
    
    ///Checks if the integer is positive.
    public var isPositive: Bool { return (self > 0) }
    
    ///Checks if the integer is negative.
    public var isNegative: Bool { return (self < 0) }
    
    ///Converts integer value to Double.
    public var toDouble: Double { return Double(self) }
    
    ///Converts integer value to Float.
    public var toFloat: Float   { return Float(self) }
    
    ///Converts integer value to CGFloat.
    public var toCGFloat: CGFloat { return CGFloat(self) }
    
    ///Converts integer value to String.
    public var toString: String { return String(self) }
    
    ///Converts integer value to UInt.
    public var toUInt: UInt { return UInt(self) }
    
    ///Converts integer value to a 0..<Int range. Useful in for loops.
    public var range: Range<Int> { return 0..<self }
    
    ///Returns number of digits in the integer.
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        } else {
            return -1; //out of bound
        }
    }
    
}

extension UInt {
    ///Convert UInt to Int
    public var toInt: Int { return Int(self) }
}


