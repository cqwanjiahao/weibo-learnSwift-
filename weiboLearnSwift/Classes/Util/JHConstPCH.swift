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
