//
//  NSDateUtils.swift
//  SwiftExtensions
//
//  Created by Trần Văn Thành on 15/02/16.
//  Copyright (c) 2015 Trần Văn Thành. All rights reserved.
//
import UIKit

extension NSDate {
    
    ///  Initializes NSDate from string and format
    public convenience init?(fromString string: String, format: String) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        if let date = formatter.dateFromString(string) {
            self.init(timeInterval: 0, sinceDate: date)
        } else {
            return nil
        }
    }
    
    ///  Converts NSDate to String
    public func toString(dateStyle dateStyle: NSDateFormatterStyle = .MediumStyle, timeStyle: NSDateFormatterStyle = .MediumStyle) -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.stringFromDate(self)
    }

    ///  Converts NSDate to String, with format
    public func toString(format format: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
    
    ///  Calculates how many days passed from now to date
    public func daysInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/86400)
        return diff
    }
    
    ///  Calculates how many hours passed from now to date
    public func hoursInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/3600)
        return diff
    }
    
    ///  Calculates how many minutes passed from now to date
    public func minutesInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff/60)
        return diff
    }
    
    ///  Calculates how many seconds passed from now to date
    public func secondsInBetweenDate(date: NSDate) -> Double {
        var diff = self.timeIntervalSinceNow - date.timeIntervalSinceNow
        diff = fabs(diff)
        return diff
    }
    
    ///  Easy creation of time passed String. Can be Years, Months, days, hours, minutes or seconds
    public func timePassed() -> String {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self, toDate: date, options: [])
        var str: String

        if components.year >= 1 {
            components.year == 1 ? (str = "year") : (str = "years")
            return "\(components.year) \(str) ago"
        } else if components.month >= 1 {
            components.month == 1 ? (str = "month") : (str = "months")
            return "\(components.month) \(str) ago"
        } else if components.day >= 1 {
            components.day == 1 ? (str = "day") : (str = "days")
            return "\(components.day) \(str) ago"
        } else if components.hour >= 1 {
            components.hour == 1 ? (str = "hour") : (str = "hours")
            return "\(components.hour) \(str) ago"
        } else if components.minute >= 1 {
            components.minute == 1 ? (str = "minute") : (str = "minutes")
            return "\(components.minute) \(str) ago"
        } else if components.second == 0 {
            return "Just now"
        } else {
            return "\(components.second) seconds ago"
        }
    }
    
}

extension NSDate: Comparable {}
 ///  Returns if dates are equal to each other
public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.isEqualToDate(rhs)
}
 ///  Returns if one date is smaller than the other
public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
  return lhs.compare(rhs) == .OrderedDescending
}
