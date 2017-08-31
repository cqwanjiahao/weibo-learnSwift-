//
//  JHWbAreaModel.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaModel: NSObject {
    let t1 = NSDictionary()
    
//    var title : String?
    var country : String?
    var addressNum : String?
    // MARK:- 自定义构造函数
  init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    class func areaPickPlist() -> NSArray {
        let areaArray = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "areaPick", ofType: ".plist")!)!
        let dics = NSMutableArray.init()

        for groupArrary in areaArray {
            for Modelarrary in groupArrary as! NSArray {
                dics.add(JHWbAreaModel.init(dict: Modelarrary as! [String : String] as [String : AnyObject]))
            }
        }
        return dics
    }
}

//extension JHWbAreaModel {
//    class func areaPickPlist() -> NSArray {
//        let areaArray = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "areaPick", ofType: ".plist")!)!
//        let dics = NSMutableArray.init()
//
//        for groupArrary in areaArray {
//            for Modelarrary in groupArrary as! NSArray {
//                dics.add(JHWbAreaModel.init(dict: Modelarrary as! [String : String]))
//            }
//        }
//        return dics
//    }
//}

