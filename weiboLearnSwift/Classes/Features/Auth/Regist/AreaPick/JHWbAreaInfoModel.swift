//
//  JHWbAreaInfoModel.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaInfoModel: NSObject {
    // MARK:- 定义模型属性
    var country : String?
    var addressNum : String?
    
    // MARK:- 自定义构造函数
  init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
