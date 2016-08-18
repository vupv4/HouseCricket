//
//  UILableUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//
import UIKit

extension UILabel {
    
    ///Extensions: fontSize: 17
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, w: w, h: h, fontSize: 17)
    }
    
    ///Extensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, fontSize: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        font = UIFont.HelveticaNeue(type: FontType.None, size: fontSize)
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        textAlignment = NSTextAlignment.Left
        userInteractionEnabled = true
        numberOfLines = 1
    }
    
    ///Extensions
    public func getEstimatedSize(width: CGFloat = CGFloat.max, height: CGFloat = CGFloat.max) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    ///Extensions
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: w, height: CGFloat.max)).height
    }
    
    ///Extensions
    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.max, height: h)).width
    }
    
    ///Extensions
    public func fitHeight() {
        self.h = getEstimatedHeight()
    }
    
    ///Extensions
    public func fitWidth() {
        self.w = getEstimatedWidth()
    }
    
    ///Extensions
    public func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    ///Extensions
    public func setText(text: String?, animated: Bool, duration: NSTimeInterval?) {
        if animated {
            UIView.transitionWithView(self, duration: duration ?? 0.3, options: .TransitionCrossDissolve, animations: { () -> Void in
                self.text = text
                }, completion: nil)
        } else {
            self.text = text
        }
        
    }
    
}


