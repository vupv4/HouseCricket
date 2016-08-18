//
//  UIViewControllerUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Notifications
    //TODO: Document this part
    public func addNotificationObserver(name: String, selector: Selector) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
    }
    
    public func removeNotificationObserver(name: String) {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: name, object: nil)
    }
    
    public func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    public func addKeyboardWillShowNotification() {
        self.addNotificationObserver(UIKeyboardWillShowNotification, selector: #selector(UIViewController.keyboardWillShowNotification(_:)));
    }
    
    public func addKeyboardDidShowNotification() {
        self.addNotificationObserver(UIKeyboardDidShowNotification, selector: #selector(UIViewController.keyboardDidShowNotification(_:)));
    }
    
    public func addKeyboardWillHideNotification() {
        self.addNotificationObserver(UIKeyboardWillHideNotification, selector: #selector(UIViewController.keyboardWillHideNotification(_:)));
    }
    
    public func addKeyboardDidHideNotification() {
        self.addNotificationObserver(UIKeyboardDidHideNotification, selector: #selector(UIViewController.keyboardDidHideNotification(_:)));
    }
    
    public func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(UIKeyboardWillShowNotification);
    }
    
    public func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(UIKeyboardDidShowNotification);
    }
    
    public func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(UIKeyboardWillHideNotification);
    }
    
    public func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(UIKeyboardDidHideNotification);
    }
    
    public func keyboardDidShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidShowWithFrame(frame!)
    }
    
    public func keyboardWillShowNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillShowWithFrame(frame!)
    }
    
    public func keyboardWillHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardWillHideWithFrame(frame!)
    }
    
    public func keyboardDidHideNotification(notification: NSNotification) {
        let nInfo = notification.userInfo as! [String: NSValue]
        let value = nInfo[UIKeyboardFrameEndUserInfoKey]
        let frame = value?.CGRectValue()
        
        keyboardDidHideWithFrame(frame!)
    }
    
    public func keyboardWillShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidShowWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardWillHideWithFrame(frame: CGRect) {
        
    }
    
    public func keyboardDidHideWithFrame(frame: CGRect) {
        
    }
    
    // Makes the UIViewController register tap events and hides keyboard when clicked somewhere in the ViewController.
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    public func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - VC Container
    
    /// Extensions
    public var top: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.top
            }
            if let nav = self.navigationController {
                if nav.navigationBarHidden {
                    return view.top
                } else {
                    return nav.navigationBar.bottom
                }
            } else {
                return view.top
            }
        }
    }
    
    /// Extensions
    public var bottom: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.bottom
            }
            if let tab = tabBarController {
                if tab.tabBar.hidden {
                    return view.bottom
                } else {
                    return tab.tabBar.top
                }
            } else {
                return view.bottom
            }
        }
    }
    
    /// Extensions
    public var tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }
    
    /// Extensions
    public var navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.h
            }
            return 0
        }
    }
    
    /// Extensions
    public var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController {
                return me.visibleViewController!.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
    
    /// Extensions
    public var navBar: UINavigationBar? {
        get {
            return navigationController?.navigationBar
        }
    }
    
    /// Extensions
    public var applicationFrame: CGRect {
        get {
            return CGRect(x: view.x, y: top, width: view.w, height: bottom - top)
        }
    }
    
    // MARK: - VC Flow
    
    /// Extensions
    public func pushVC(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Extensions
    public func popVC() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    /// Extensions
    public func presentVC(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
    /// Extensions
    public func dismissVC(completion completion: (() -> Void)? ) {
        dismissViewControllerAnimated(true, completion: completion)
    }
    
    /// Extensions
    public func addAsChildViewController(vc: UIViewController, toView: UIView){
        toView.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMoveToParentViewController(self)
    }
    
    /// Adds image named: as a UIImageView in the Background
    func setBackgroundImage(named: String) {
        let image = UIImage(named: named)
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    /// Adds UIImage as a UIImageView in the Background
    @nonobjc func setBackgroundImage(image: UIImage) {
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
}

