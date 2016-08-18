//
//  BlockSwipe.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

public class BlockSwipe: UISwipeGestureRecognizer {
    
    private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (direction: UISwipeGestureRecognizerDirection,
        fingerCount: Int = 1,
        action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction
            numberOfTouchesRequired = fingerCount
            swipeAction = action
            addTarget(self, action: #selector(BlockSwipe.didSwipe(_:)))
    }
    
    public func didSwipe (swipe: UISwipeGestureRecognizer) {
        swipeAction? (swipe)
    }
}
