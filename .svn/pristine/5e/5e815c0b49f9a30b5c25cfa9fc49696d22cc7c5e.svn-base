//
//  DoubleUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//
import UIKit

extension Double {
    ///  Converts Double to String
    public var toString: String { return String(self) }
    ///  Converts Double to Int
    public var toInt: Int { return Int(self) }
    
    ///  Returns a Double rounded to decimal
    public func getRoundedByPlaces(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
    
    ///  Rounds the current Double rounded to decimal
    public mutating func roundByPlaces(places: Int) {
        let divisor = pow(10.0, Double(places))
        self = round(self * divisor) / divisor
    }
}

