//
//  JHScreenFitUtil.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHScreenFitUtil {
    // MARK:- 设计单例对象
    static let sharedUtils = JHScreenFitUtil()
    
    // MARK:- 提供快速通过xib创建的类方法
//    class func visitorView() -> VisitorView {
//        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).first as! VisitorView
//    }
    
   class func fixWidth(width: Double) {
//        return JHScreenFitUtil
    }
    
//    class func getLength(length: Double) -> Double {
//        if (IPhone4_4s) {
//            return length * 0.85;
//        } else if (iPhone5SE) {
//            return length * 0.85;
//        } else if (iPhone5_5s) {
//            return length * 0.85;
//        } else if (iPhone6_6s_7) {
//            return length;
//        } else if (iPhone6Plus_6sPlus_7Plus) {
//            return length * 1.1;
//        }
//        return length
//    }
}

class JHDevices {
    let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    let SCREEN_MAX_LENGTH = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
    let SCALE = UIScreen.main.scale
//    let IPhone4_4s : Bool {
//
//    }
    
}
