//
//  UIButton-Extension.swift
//  weiboLearnSwift
//
//  Created by 家豪万 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

extension UIButton {
    //设置图片
    convenience init(imageName:String) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
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
    
//    convenience init(fromView: UIView, backTitle: String, target: Any, action: Selector) {
//    let leftBtn = UIButton()
//        fromView.addSubview(leftBtn)
//        leftBtn.setImage(#imageLiteral(resourceName: "nav_backBtn"), for: .normal)
//        leftBtn.setTitle(backTitle, for: .normal)
//        leftBtn.setTitleColor(.black, for: .normal)
//        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
//        leftBtn.sizeToFit()
//        leftBtn.addTarget(target, action: action, for: .touchUpInside)
//        self.init(customView: leftBtn)
//}
}

