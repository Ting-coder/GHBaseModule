//
//  CALayer_layout.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import UIKit

public extension CALayer {
    public var x : CGFloat {
        get{ return self.frame.origin.x }
        set(x) {
            self.frame.origin = CGPoint(x: x, y: self.frame.origin.y)
        }
    }
    public var y : CGFloat {
        get{ return self.frame.origin.y }
        set(y) {
            self.frame.origin = CGPoint(x: self.x, y: y)
        }
    }
    public var width : CGFloat {
        get{ return self.frame.size.width }
        set(width) {
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    public var height : CGFloat {
        get{ return self.frame.size.height }
        set(height) {
            self.frame.size = CGSize(width: self.width, height: height)
        }
    }
    public var right : CGFloat {
        get{ return self.frame.origin.x + self.frame.size.width }
        set(right) {
            var frame = self.frame
            frame.origin.x = right - frame.size.width
            self.frame = frame
        }
    }
    public var bottom: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height }
        set(bottom) {
            var frame = self.frame
            frame.origin.y = bottom - frame.size.height
            self.frame = frame
        }
    }
    public var center: CGPoint {
        get { return CGPoint(x: self.frame.origin.x + self.frame.size.width * 0.5,
                             y: self.frame.origin.y + self.frame.size.height * 0.5) }
        set(center) {
            var frame = self.frame
            frame.origin.x = center.x - frame.size.width * 0.5
            frame.origin.y = center.y - frame.size.height * 0.5
            self.frame = frame
        }
    }
    public var centerX: CGFloat {
        get { return self.frame.origin.x + self.frame.size.width * 0.5 }
        set(centerX) {
            var frame = self.frame
            frame.origin.x = centerX - frame.size.width * 0.5
            self.frame = frame
        }
    }
    public var centerY: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height * 0.5 }
        set(centerY) {
            var frame = self.frame
            frame.origin.y = centerY - frame.size.height * 0.5
            self.frame = frame
        }
    }
    public var origin: CGPoint {
        get { return self.frame.origin }
        set(origin) {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    public var frameSize: CGSize {
        get { return self.frame.size }
        set(frameSize) {
            var frame = self.frame
            frame.size = frameSize
            self.frame = frame
        }
    }
}
