//
//  BlockLongPress.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

public class BlockLongPress: UILongPressGestureRecognizer {
    
    private var longPressAction: ((UILongPressGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (action: ((UILongPressGestureRecognizer) -> Void)?) {
        self.init()
        longPressAction = action
        addTarget(self, action: #selector(BlockLongPress.didLongPressed(_:)))
    }
    
    public func didLongPressed(longPress: UILongPressGestureRecognizer) {
        if longPress.state == UIGestureRecognizerState.Began {
            longPressAction?(longPress)
        }
    }
}
