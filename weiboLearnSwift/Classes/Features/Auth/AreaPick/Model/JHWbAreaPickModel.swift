//
//  JHWbAreaPickModel.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickModel: NSObject {
    // MARK:- 定义模型属性
    var titleName : String?
    var areas : NSArray? 
    
    

    // MARK:- 自定义构造函数
    init(dict : [String : AnyObject]) {
        super.init()
            setValuesForKeys(dict)
            if let areasDict = dict["areas"] as? NSArray {
                //遍历数组
                let dicArray = NSMutableArray.init()
                for dic in areasDict {
                    dicArray.add(JHWbAreaInfoModel.init(dict: dic as! [String : AnyObject]))
                }
                areas = dicArray
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
