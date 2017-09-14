//
//  JHWbSettingGroupModel.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/13.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingGroupModel: NSObject {
    var headerTitle : String?
    var footerTitle : String?
    var items : NSArray?
    public init(items: NSArray) {
        super.init()
        self.items = items
    }
}
