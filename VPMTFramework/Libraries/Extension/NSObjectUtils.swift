//
//  NSObjectUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension NSObject {
    
    public var className: String {
        return self.dynamicType.className
    }
    
    public static var className: String {
        return String(self)
    }
    
}
