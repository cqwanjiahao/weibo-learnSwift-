//
//  JHWbSetti大牛小牛是什么车ngItemModel.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/13.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingItemModel: NSObject {
    var icon : UIImage?
    var title : String?
    //写一个闭包处理 点击cell的事件@property (nonatomic, copy) void(^operationBlock)(NSIndexPath *indexPath);
//    convenience init(icon: UIImage,title: String) {
//        self.init()
//        self.icon = icon
//        self.title = title
//    }
    
    public init(icon: UIImage, title: String) {
        super.init()
        self.icon = icon
        self.title = title
    }
    
    public init(title: String) {
        super.init()
        self.title = title
    }
    public override init() {
        super.init()
    }
}

class JHWbSettingArrowItemModel: JHWbSettingItemModel {
    var desVC : AnyClass?
}

class JHWbSettingSwitchItemModel: JHWbSettingItemModel {
    //开关状态
    var switchOn = true
}
