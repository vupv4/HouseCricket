//
//  UIViewUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

// MARK: Custom UIView Initilizers
extension UIView {
    
    ///Extensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
    }
    
    ///Extensions, puts padding around the view
    public convenience init(superView: UIView, padding: CGFloat) {
        self.init(frame: CGRect(x: superView.x + padding, y: superView.y + padding, width: superView.w - padding*2, height: superView.h - padding*2))
    }
    
    ///Extensions - Copies size of superview
    public convenience init(superView: UIView) {
        self.init(frame: CGRect(origin: CGPointZero, size: superView.size))
    }
}

// MARK: Frame Extensions
extension UIView {
    //TODO: Multipe addsubview
    //TODO: Add pics to readme
    ///Extensions, resizes this view so it fits the largest subview
    public func resizeToFitSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView
            let newWidth = aView.x + aView.w
            let newHeight = aView.y + aView.h
            width = max(width, newWidth)
            height = max(height, newHeight)
        }
        frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    ///Extensions, resizes this view so it fits the largest subview
    public func resizeToFitSubviews(tagsToIgnore: [Int]) {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView
            if !tagsToIgnore.contains(someView.tag) {
                let newWidth = aView.x + aView.w
                let newHeight = aView.y + aView.h
                width = max(width, newWidth)
                height = max(height, newHeight)
            }
        }
        frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
    ///Extensions
    public func resizeToFitWidth() {
        let currentHeight = self.h
        self.sizeToFit()
        self.h = currentHeight
    }
    
    ///Extensions
    public func resizeToFitHeight() {
        let currentWidth = self.w
        self.sizeToFit()
        self.w = currentWidth
    }
    
    ///Extensions
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.y, width: self.w, height: self.h)
        }
    }
    
    ///Extensions
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.w, height: self.h)
        }
    }
    
    ///Extensions
    public var w: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.h)
        }
    }
    
    ///Extensions
    public var h: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.w, height: value)
        }
    }
    
    ///Extensions
    public var left: CGFloat {
        get {
            return self.x
        } set(value) {
            self.x = value
        }
    }
    
    ///Extensions
    public var right: CGFloat {
        get {
            return self.x + self.w
        } set(value) {
            self.x = value - self.w
        }
    }
    
    ///Extensions
    public var top: CGFloat {
        get {
            return self.y
        } set(value) {
            self.y = value
        }
    }
    
    ///Extensions
    public var bottom: CGFloat {
        get {
            return self.y + self.h
        } set(value) {
            self.y = value - self.h
        }
    }
    
    ///Extensions
    public var origin: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect(origin: value, size: self.frame.size)
        }
    }
    
    ///Extensions
    public var centerX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    ///Extensions
    public var centerY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
    
    ///Extensions
    public var size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect(origin: self.frame.origin, size: value)
        }
    }
    
    ///Extensions
    public func leftOffset(offset: CGFloat) -> CGFloat {
        return self.left - offset
    }
    
    ///Extensions
    public func rightOffset(offset: CGFloat) -> CGFloat {
        return self.right + offset
    }
    
    ///Extensions
    public func topOffset(offset: CGFloat) -> CGFloat {
        return self.top - offset
    }
    
    ///Extensions
    public func bottomOffset(offset: CGFloat) -> CGFloat {
        return self.bottom + offset
    }
    
    //TODO: Add to readme
    ///Extensions
    public func alignRight(offset: CGFloat) -> CGFloat {
        return self.w - offset
    }
    
    ///Extensions
    public func reorderSubViews(reorder: Bool = false, tagsToIgnore: [Int] = []) -> CGFloat {
        var currentHeight: CGFloat = 0
        for someView in subviews {
            if !tagsToIgnore.contains(someView.tag) && !(someView ).hidden {
                if reorder {
                    let aView = someView
                    aView.frame = CGRect(x: aView.frame.origin.x, y: currentHeight, width: aView.frame.width, height: aView.frame.height)
                }
                currentHeight += someView.frame.height
            }
        }
        return currentHeight
    }
    
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    ///  Centers view in superview horizontally
    public func centerXInSuperView() {
        if self.superview != nil {
            self.x = self.superview!.w/2 - self.w/2
        } else {
            assertionFailure("Your view doesnt have a superview")
        }
    }
    
    ///  Centers view in superview vertically
    public func centerYInSuperView() {
        if self.superview != nil {
            self.y = self.superview!.h/2 - self.h/2
        } else {
            assertionFailure("Your view doesnt have a superview")
        }
    }
    
    ///  Centers view in superview horizontally & vertically
    public func centerInSuperView() {
        self.centerXInSuperView()
        self.centerYInSuperView()
    }
}

// MARK: Transform Extensions
extension UIView {
    ///Extensions
    public func setRotationX(x: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, x.degreesToRadians(), 1.0, 0.0, 0.0)
        self.layer.transform = transform
    }
    
    ///Extensions
    public func setRotationY(y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, y.degreesToRadians(), 0.0, 1.0, 0.0)
        self.layer.transform = transform
    }
    
    ///Extensions
    public func setRotationZ(z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, z.degreesToRadians(), 0.0, 0.0, 1.0)
        self.layer.transform = transform
    }
    
    ///Extensions
    public func setRotation(x x: CGFloat, y: CGFloat, z: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DRotate(transform, x.degreesToRadians(), 1.0, 0.0, 0.0)
        transform = CATransform3DRotate(transform, y.degreesToRadians(), 0.0, 1.0, 0.0)
        transform = CATransform3DRotate(transform, z.degreesToRadians(), 0.0, 0.0, 1.0)
        self.layer.transform = transform
    }
    
    ///Extensions
    public func setScale(x x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        self.layer.transform = transform
    }
    
}

// MARK: Layer Extensions
extension UIView {
    ///Extensions
    public func setCornerRadius(radius radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    //TODO: add this to readme
    ///Extensions
    public func addShadow(offset offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.CGColor
        if let r = cornerRadius {
            self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).CGPath
        }
    }
    
    ///Extensions
    public func addBorder(width width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.CGColor
        layer.masksToBounds = true
    }
    
    ///Extensions
    public func addBorderTop(size size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    
    //TODO: add to readme
    ///Extensions
    public func addBorderTopWithPadding(size size: CGFloat, color: UIColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, height: size, color: color)
    }
    
    ///Extensions
    public func addBorderBottom(size size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    
    ///Extensions
    public func addBorderLeft(size size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    ///Extensions
    public func addBorderRight(size size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    
    ///Extensions
    private func addBorderUtility(x x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
    //TODO: add this to readme
    ///Extensions
    public func drawCircle(fillColor fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = fillColor.CGColor
        shapeLayer.strokeColor = strokeColor.CGColor
        shapeLayer.lineWidth = strokeWidth
        self.layer.addSublayer(shapeLayer)
    }
    //TODO: add this to readme
    ///Extensions
    public func drawStroke(width width: CGFloat, color: UIColor) {
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.w, height: self.w), cornerRadius: self.w/2)
        let shapeLayer = CAShapeLayer ()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = color.CGColor
        shapeLayer.lineWidth = width
        self.layer.addSublayer(shapeLayer)
    }
    
}

private let UIViewAnimationDuration: NSTimeInterval = 1
private let UIViewAnimationSpringDamping: CGFloat = 0.5
private let UIViewAnimationSpringVelocity: CGFloat = 0.5

//TODO: add this to readme
// MARK: Animation Extensions
extension UIView {
    
    ///Extensions
    public func spring(animations animations: (() -> Void), completion: ((Bool) -> Void)? = nil) {
        spring(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    ///Extensions
    public func spring(duration duration: NSTimeInterval, animations: (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(UIViewAnimationDuration, delay: 0, usingSpringWithDamping: UIViewAnimationSpringDamping, initialSpringVelocity: UIViewAnimationSpringVelocity, options: UIViewAnimationOptions.AllowAnimatedContent, animations: animations, completion: completion)
    }
    
    ///Extensions
    public func animate(duration duration: NSTimeInterval, animations: (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration, animations: animations, completion: completion)
    }
    
    ///Extensions
    public func animate(animations animations: (()->Void), completion: ((Bool) -> Void)? = nil) {
        animate(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    ///Extensions
    public func pop() {
        setScale(x: 1.1, y: 1.1)
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1)
            })
    }
    
    ///Extensions
    public func popBig() {
        setScale(x: 1.25, y: 1.25)
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1)
            })
    }
}

//TODO: add this to readme
// MARK: Render Extensions
extension UIView {
    
    ///Extensions
    public func toImage () -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}

// MARK: Gesture Extensions
extension UIView {
    
    /// http://stackoverflow.com/questions/4660371/how-to-add-a-touch-event-to-a-uiview/32182866#32182866
    ///Extensions
    public func addTapGesture(tapNumber tapNumber: Int = 1, target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addTapGesture(tapNumber tapNumber: Int = 1, action: ((UITapGestureRecognizer) -> ())?) {
        let tap = BlockTap(tapCount: tapNumber, fingerCount: 1, action: action)
        addGestureRecognizer(tap)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addSwipeGesture(direction direction: UISwipeGestureRecognizerDirection, numberOfTouches: Int = 1, target: AnyObject, action: Selector) {
        let swipe = UISwipeGestureRecognizer(target: target, action: action)
        swipe.direction = direction
        swipe.numberOfTouchesRequired = numberOfTouches
        addGestureRecognizer(swipe)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addSwipeGesture(direction direction: UISwipeGestureRecognizerDirection, numberOfTouches: Int = 1, action: ((UISwipeGestureRecognizer) -> ())?) {
        let swipe = BlockSwipe(direction: direction, fingerCount: numberOfTouches, action: action)
        addGestureRecognizer(swipe)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addPanGesture(target target: AnyObject, action: Selector) {
        let pan = UIPanGestureRecognizer(target: target, action: action)
        addGestureRecognizer(pan)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addPanGesture(action action: ((UIPanGestureRecognizer) -> ())?) {
        let pan = BlockPan(action: action)
        addGestureRecognizer(pan)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addPinchGesture(target target: AnyObject, action: Selector) {
        let pinch = UIPinchGestureRecognizer(target: target, action: action)
        addGestureRecognizer(pinch)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addPinchGesture(action action: ((UIPinchGestureRecognizer) -> ())?) {
        let pinch = BlockPinch(action: action)
        addGestureRecognizer(pinch)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addLongPressGesture(target target: AnyObject, action: Selector) {
        let longPress = UILongPressGestureRecognizer(target: target, action: action)
        addGestureRecognizer(longPress)
        userInteractionEnabled = true
    }
    
    ///Extensions
    public func addLongPressGesture(action action: ((UILongPressGestureRecognizer) -> ())?) {
        let longPress = BlockLongPress(action: action)
        addGestureRecognizer(longPress)
        userInteractionEnabled = true
    }
}

//TODO: add to readme
extension UIView {
    ///Extensions [UIRectCorner.TopLeft, UIRectCorner.TopRight]
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    
    ///Extensions
    public func roundView() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2
    }
    
}

extension UIView {
    
    ///Extensions
    /**
     Shakes the view for as many number of times as given in the argument
     */
    public func shakeViewForTimes(times: Int) {
        let anim = CAKeyframeAnimation(keyPath: "transform")
        anim.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(-5, 0, 0 )),
            NSValue(CATransform3D: CATransform3DMakeTranslation( 5, 0, 0 ))
        ]
        anim.autoreverses = true
        anim.repeatCount = Float(times)
        anim.duration = 7/100
        
        self.layer.addAnimation(anim, forKey: nil)
    }
    
}

extension UIView {
    /// Loops until it finds the top root view. //TODO: Add to readme
    func rootView() -> UIView {
        guard superview != nil else {
            return self
        }
        return superview!.rootView()
    }
}
class UIColoredView: UIView {
    
    init() {
        super.init(frame: CGRect(x: 100, y: 100, w: 100, h: 100))
        backgroundColor = UIColor.randomColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
