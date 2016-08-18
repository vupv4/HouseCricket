//
//  BlockTap.swift
//  SwiftFramework
//
//  Created by Pacific Ocean on 4/4/16.
//  Copyright © 2016 Pacific Ocean. All rights reserved.
//

import UIKit

public class BlockTap: UITapGestureRecognizer {
    
    private var tapAction: ((UITapGestureRecognizer) -> Void)?
    
    public override init(target: AnyObject?, action: Selector) {
        super.init(target: target, action: action)
    }
    
    public convenience init (
        tapCount: Int = 1,
        fingerCount: Int = 1,
        action: ((UITapGestureRecognizer) -> Void)?) {
            self.init()
            self.numberOfTapsRequired = tapCount
            self.numberOfTouchesRequired = fingerCount
            self.tapAction = action
            self.addTarget(self, action: #selector(BlockTap.didTap(_:)))
    }
    
    public func didTap (tap: UITapGestureRecognizer) {
        tapAction? (tap)
    }
    
}
