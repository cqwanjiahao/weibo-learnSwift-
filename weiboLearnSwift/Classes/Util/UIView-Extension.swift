//
//  UIView-Extension.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/6.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

extension UIView {
    //设置图片
    convenience init(lineViewColor: UIColor) {
        self.init()
        backgroundColor = lineViewColor
    }
}
