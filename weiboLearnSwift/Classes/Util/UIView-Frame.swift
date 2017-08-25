//
//  UIView-Frame.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
// MARK: - FrameExtension
extension UIView  {
    var jh_width : CGFloat {
        get {
            return frame.size.width
        }
        set(jh_width) {
            var rect = frame
            rect.size.width = jh_width
            frame = rect
        }
    }
    
    var jh_height : CGFloat {
        get {
            return frame.size.height
        }
        set(jh_height) {
            var rect = frame
            rect.size.height = jh_height
            frame = rect
        }
    }
    
    var jh_size : CGSize {
        get {
            return frame.size
        }
        set(jh_size) {
            var rect = frame
            rect.size = jh_size
            frame = rect
        }
    }
    
    var jh_x : CGFloat {
        get {
            return frame.origin.x
        }
        set(jh_x) {
            var rect = frame
            rect.origin.x = jh_x
            frame = rect
        }
    }
    
    var jh_y : CGFloat {
        get {
            return frame.origin.y
        }
        set(jh_y) {
            var rect = frame
            rect.origin.y = jh_y
            frame = rect
        }
    }
    
    var jh_centerX : CGFloat {
        get {
            return center.x
        }
        set(jh_centerX) {
            var point = center
            point.x = jh_centerX
            center = point
        }
    }
    
    var jh_centerY : CGFloat {
        get {
            return center.y
        }
        set(jh_centerY) {
            var point = center
            point.y = jh_centerY
            center = point
        }
    }
}
