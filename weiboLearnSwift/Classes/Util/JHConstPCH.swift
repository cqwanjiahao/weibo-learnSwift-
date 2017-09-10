//
//  JHPCH.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
extension NSObject {
    ///自定义Log
    func jh_log<T>(messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
        #if DEBUG
            let fileName = (file as NSString).lastPathComponent
            print("\(fileName) : (\(lineNum))  -  \(messsage)")
        #endif
    }
    
    //通过颜色创建图片
    func jh_createImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    //通过颜色创建拉伸图片 forButton
    func jh_createStretchImageWithColor(color: UIColor) -> UIImage {
       return  jh_createImageWithColor(color: color).resizableImage(withCapInsets: UIEdgeInsetsMake(1, 1, 1, 1), resizingMode: .stretch)
    }
}

extension UIImage {
    ///不渲染的图片
    class func originalImage(imageName: String) -> UIImage {
        let originalImage = UIImage.init(named: imageName)
        originalImage?.withRenderingMode(.alwaysOriginal)
        return originalImage!
    }
}
//let JHIOS7 = Double(UIDevice().systemVersion)! >= 7.0 ? true : false
//let JHIOS8 = Double(UIDevice().systemVersion)! >= 8.0 ? true : false

///获取通知中心
//    let WBNotificationCenter = NSNotificationCenter.defaultCenter()
//弱引用/强引用
//#define LRWeakSelf(type)  __weak typeof(type) weak##type = type;
//#define LRStrongSelf(type)  __strong typeof(type) type = weak##type;
