//
//  UIImageUtils.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

extension UIImage {
    
    ///  Returns compressed image to rate from 0 to 1
    public func compressImage(rate rate: CGFloat) -> NSData {
        let compressedImage = UIImageJPEGRepresentation(self, rate)
        return compressedImage!
    }
    
    ///  Returns Image size in Bytes
    public func getSizeAsBytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length
    }
    
    ///  Returns Image size in Kylobites
    public func getSizeAsKilobytes() -> Int {
        let imageData = NSData(data: UIImageJPEGRepresentation(self, 1)!)
        return imageData.length / 1024
    }
    
    ///  scales image
    public class func scaleTo(image image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    ///  Returns resized image with width. Might return low quality
    public func resizeWithWidth(width: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: width, height: aspectHeightForWidth(width))
        
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    ///  Returns resized image with height. Might return low quality
    public func resizeWithHeight(height: CGFloat) -> UIImage {
        let aspectSize = CGSize (width: aspectWidthForHeight(height), height: height)
        
        UIGraphicsBeginImageContext(aspectSize)
        self.drawInRect(CGRect(origin: CGPointZero, size: aspectSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    /// 
    public func aspectHeightForWidth(width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    /// 
    public func aspectWidthForHeight(height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    ///  Returns cropped image from CGRect
    public func croppedImage(bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print(" Your cropping X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print(" Your cropping Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        let imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        let croppedImage: UIImage = UIImage(CGImage: imageRef!, scale: self.scale, orientation: UIImageOrientation.Up)
        return croppedImage
    }
    
    /// Returns the image associated with the URL
    public convenience init?(urlString: String) {
        guard let url = NSURL(string: urlString) else {
            self.init(data: NSData())
            return
        }
        guard let data = NSData(contentsOfURL: url) else {
            print(" No image in URL")
            self.init(data: NSData())
            return
        }
        self.init(data: data)
    }
    
    /// Returns an empty image //TODO: Add to readme
    public class func blankImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}

