//
//  BoolUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

extension Bool {
    
    ///Toggle boolean value.
    public mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
}
