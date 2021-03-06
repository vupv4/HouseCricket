//
//  UIAlertViewControllerUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /// Easy way to present UIAlertController
    func show() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(self, animated: true, completion: nil)
    }
    
    static func showWarning(title: String?, message: String?, buttonOK: String?, view:UIViewController)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: buttonOK, style: UIAlertActionStyle.Default,handler: nil))
        view.presentViewController(alertController, animated: true, completion: nil)
    }
}
