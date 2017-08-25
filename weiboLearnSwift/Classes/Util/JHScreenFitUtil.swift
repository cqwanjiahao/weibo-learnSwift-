//
//  JHScreenFitUtil.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
extension NSObject {
    func jh_getLength(length : CGFloat) -> CGFloat {
        return JHScreenFitUtil.fixLength(length:length)
    }
    
    func jh_getsize(x : CGFloat , y : CGFloat) -> CGSize {
        return CGSize.init(width: JHScreenFitUtil.fixLength(length:x), height: JHScreenFitUtil.fixLength(length:y))
    }
}
class JHScreenFitUtil {
    // MARK:- 设计单例对象
    static let sharedUtils = JHScreenFitUtil()
    class func fixLength(length: CGFloat) -> CGFloat {
        if (JHDevices.sharedDevices.IPhone4_4s) {
            return length * 0.85;
        } else if (JHDevices.sharedDevices.IPhone5_5s_SE) {
            return length * 0.85;
        } else if (JHDevices.sharedDevices.IPhone6_6s_7) {
            return length;
        } else if (JHDevices.sharedDevices.IPhone6Plus_6sPlus_7Plus) {
            return length * 1.1;
        }
        return length
    }
}

class JHDevices {
    static let sharedDevices = JHDevices()
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let SCREEN_MAX_LENGTH = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    let SCALE = UIScreen.main.scale
    var IPhone4_4s : Bool {
        get{
            if SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 480.0 && SCALE == 1  {
                return true
            }
            return false
        }
    }
    var IPhone5_5s_SE : Bool {
        get{
            if SCREEN_WIDTH == 320.0 && SCREEN_HEIGHT == 568.0 && SCALE == 2  {
                return true
            }
            return false
        }
    }
    var IPhone6_6s_7 : Bool {
        get{
            if SCREEN_WIDTH == 375.0 && SCREEN_HEIGHT == 667.0 && SCALE == 2  {
                return true
            }
            return false
        }
    }
    var IPhone6Plus_6sPlus_7Plus : Bool {
        get{
            if SCREEN_WIDTH == 414.0 && SCREEN_HEIGHT == 736.0 && SCALE == 3  {
                return true
            }
            return false
        }
    }
}
