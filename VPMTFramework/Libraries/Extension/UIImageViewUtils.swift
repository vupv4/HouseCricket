//
//  UIImageViewUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//
import UIKit

extension UIImageView {
    
    /// Extensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        image = UIImage(named: imageName)
    }
    
    /// Extensions
    public convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        if image != nil {
            scaleImageFrameToWidth(width: scaleToWidth)
        } else {
            assertionFailure("Extensions Error: The imageName is invalid!!!")
        }
    }
    
    /// Extensions
    public convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }
    
    /// Extensions
    public convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }
    
    /// Extensions, scales this ImageView size to fit the given width
    public func scaleImageFrameToWidth(width width: CGFloat) {
        guard image != nil else {
            print("Extensions Error: The image is not set yet!")
            return
        }
        let widthRatio = image!.size.width / width
        let newWidth = image!.size.width / widthRatio
        let newHeigth = image!.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }
    
    /// Extensions, scales this ImageView size to fit the given height
    public func scaleImageFrameToHeight(height height: CGFloat) {
        guard image != nil else {
            print("Extensions Error: The image is not set yet!")
            return
        }
        let heightRatio = image!.size.height / height
        let newHeight = image!.size.height / heightRatio
        let newWidth = image!.size.width / heightRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }
    
    /// Extensions
    public func roundSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    /// Extensions
    public func imageWithUrl(url url: String) {
        vpmtUtils.requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }
    
    /// Extensions
    public func imageWithUrl(url url: String, placeholder: UIImage) {
        self.image = placeholder
        vpmtUtils.requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }
    
    /// Extensions
    public func imageWithUrl(url url: String, placeholderNamed: String) {
        self.image = UIImage(named: placeholderNamed)
        vpmtUtils.requestImage(url, success: { (image) -> Void in
            if let img = image {
                self.image = img
            }
        })
    }
    
}

