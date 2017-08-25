//
//  UIButton-Extension.swift
//  weiboLearnSwift
//
//  Created by 家豪万 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

extension UIButton {
    //设置图片
    convenience init(imageName:String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .selected)
        sizeToFit()
    }
    
    convenience init(imageName : String, highlighImageName : String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: highlighImageName), for: .selected)
        sizeToFit()
    }
    
   ///创建button
    convenience init(imageName: String, highlighImageName: String, target: Any, action: Selector) {
        self.init(imageName: imageName, highlighImageName: highlighImageName)
        addTarget(target, action: action, for: .touchUpInside)
//        self.jh_size = self.currentBackgroundImage?.size
    }
}

extension UIBarButtonItem {
    convenience init(imageName : String) {
        let button = UIButton.init(imageName: imageName)
        self.init(customView: button)
    }
    
    convenience init(imageName : String, highlighImageName : String) {
        let button = UIButton.init(imageName: imageName, highlighImageName: highlighImageName)
        self.init(customView: button)
    }
}
