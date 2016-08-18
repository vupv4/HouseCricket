//
//  BaseRequest.swift
//  VPMTFramework
//
//  Created by Vu Phan on 4/7/16.
//  Copyright © 2016 beeTeam. All rights reserved.
//

import UIKit

class BaseRequest: NSObject {
    
    // Convert BaseRequest to Dictionary<String, AnyObject>()
    func toDict() -> [String: AnyObject]
    {
        var dict = Dictionary<String, AnyObject>()
        let otherSelf = Mirror(reflecting: self)
        
        for child in otherSelf.children
        {
            if let key = child.label {
                dict[key] = child.value as? NSString
            }
        }
        return dict
    }
}
