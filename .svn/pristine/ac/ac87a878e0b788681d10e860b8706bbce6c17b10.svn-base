//
//  StringUtils.swift
//  SwiftExtensions
//
//  Created by Trần Văn Thành on 15/02/16.
//  Copyright (c) 2015 Trần Văn Thành. All rights reserved.
//
import UIKit

extension String {
    
    /// Cut string from integerIndex to the end
    public subscript(integerIndex: Int) -> Character {
        let index = startIndex.advancedBy(integerIndex)
        return self[index]
    }
    
    /// Cut string from range
    public subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
    
    /// Character count
    public var length: Int {
        return self.characters.count
    }
    
    /// Counts number of instances of the input inside String
    public func count(substring: String) -> Int{
        return componentsSeparatedByString(substring).count - 1
    }

    /// Capitalizes first character of String
    public var capitalizeFirst: String {
        var result = self
        result.replaceRange(startIndex...startIndex, with: String(self[startIndex]).capitalizedString)
        return result
    }
    
    /// Counts whitespace & new lines
    public func isOnlyEmptySpacesAndNewLineCharacters() -> Bool {
        let characterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let newText = self.stringByTrimmingCharactersInSet(characterSet)
        return newText.isEmpty
    }
    
    /// Trims white space and new line characters
    public mutating func trim() {
         self = self.trimmed()
    }
    
    /// Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).joinWithSeparator("")
    }
  
    /// Checks if String contains Email
    public var isEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        let firstMatch = dataDetector?.firstMatchInString(self, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, length))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.URL?.scheme == "mailto")
    }
    
    /// Returns if String is a number
    public func isNumber() -> Bool {
        if let _ = NSNumberFormatter().numberFromString(self) {
            return true
        }
        return false
    }
    
    /// Extracts URLS from String
    public var extractURLs: [NSURL] {
        var urls : [NSURL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingType.Link.rawValue)
        } catch _ as NSError {
            detector = nil
        }

        let text = self
        
        detector!.enumerateMatchesInString(text, options: [], range: NSMakeRange(0, text.characters.count), usingBlock: {
            (result: NSTextCheckingResult?, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            urls.append(result!.URL!)
        })
        
        return urls
    }
    
    /// Checking if String contains input
    public func contains(find: String) -> Bool {
        return self.rangeOfString(find) != nil
    }
    
    /// Checking if String contains input with comparing options
    public func contains(find: String, compareOption: NSStringCompareOptions) -> Bool {
        return self.rangeOfString(find, options: compareOption) != nil
    }
    
    /// Converts String to Int
    public func toInt() -> Int? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.integerValue
        } else {
            return nil
        }
    }
    
    /// Converts String to Double
    public func toDouble() -> Double? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// Converts String to Float
    public func toFloat() -> Float? {
        if let num = NSNumberFormatter().numberFromString(self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    /// Converts String to Bool
    public func toBool() -> Bool? {
        let trimmed = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).lowercaseString
        if trimmed == "true" || trimmed == "false" {
            return (trimmed as NSString).boolValue
        }
        return nil
    }
    
    /// Returns the first index of the occurency of the character in String
    public func getIndexOf(char: Character) -> Int? {
        for (index, c) in characters.enumerate() {
            if c == char {
                return index
            }
        }
        return nil
    }
    
    /// Converts String to NSString
    public var toNSString: NSString { get { return self as NSString } }
    
    ///Returns bold NSAttributedString
    public func bold() -> NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(UIFont.systemFontSize())])
        return boldString
    }
  
    /// Returns underlined NSAttributedString
    public func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
        return underlineString
    }
  
    /// Returns italic NSAttributedString
    public func italic() -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFontOfSize(UIFont.systemFontSize())])
        return italicString
    }
  
    /// Returns NSAttributedString
    public func color(color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
        return colorString
    }
    
    /// Checks if String contains Emoji
    public func includesEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).characterAtIndex(i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        return false
    }
    
}
extension Character {
    /// Converts Character to String //TODO: Add to readme
    public var toString: String { return String(self) }
}

