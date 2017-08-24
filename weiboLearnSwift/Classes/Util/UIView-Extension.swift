//
//  UIView-Extension.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

extension UIView {
    //对frame的get方法的二次封装
   class func x(object : UIView) -> CGFloat {
        return object.frame.origin.x
    }
    class func y(object : UIView) -> CGFloat {
        return object.frame.origin.y
    }
    class func w(object : UIView) -> CGFloat {
        return object.frame.size.width
    }
    class func h(object : UIView) -> CGFloat {
        return object.frame.size.height
    }
}
