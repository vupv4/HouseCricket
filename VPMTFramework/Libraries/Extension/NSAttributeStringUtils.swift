//
//  NSAttributeStringUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    /// Adds bold attribute to NSAttributedString and returns it
    func bold() -> NSAttributedString {
        let copy = self.mutableCopy()
        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())], range: range)
        return copy as! NSAttributedString
    }
    
    /// Adds underline attribute to NSAttributedString and returns it
    func underline() -> NSAttributedString {
        let copy = self.mutableCopy()
        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue], range: range)
        return copy as! NSAttributedString
    }
    
    /// Adds italic attribute to NSAttributedString and returns it
    func italic() -> NSAttributedString {
        let copy = self.mutableCopy()
        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSFontAttributeName: UIFont.italicSystemFontOfSize(UIFont.systemFontSize())], range: range)
        return copy as! NSAttributedString
    }
    
    /// Adds color attribute to NSAttributedString and returns it
    func color(color: UIColor) -> NSAttributedString {
        let copy = self.mutableCopy()
        let range = (self.string as NSString).rangeOfString(self.string)
        copy.addAttributes([NSForegroundColorAttributeName: color], range: range)
        return copy as! NSAttributedString
    }
}

/// Appends one NSAttributedString to another NSAttributedString and returns it
public func += (inout left: NSAttributedString, right: NSAttributedString) {
    let ns = NSMutableAttributedString(attributedString: left)
    ns.appendAttributedString(right)
    left = ns
}

