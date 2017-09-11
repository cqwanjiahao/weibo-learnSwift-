//
//  JHWbAreaPickOtherAreaBtn.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickOtherAreaBtn: UIButton {
    init(addTargt: Any, action: Selector) {
        super.init(frame: CGRect.zero)
        setBackgroundImage(jh_createStretchImageWithColor(color: .jh_setColor(r: 240, g: 239, b: 244)), for: .normal)
        setTitle("不在以上区域,请尝试邮箱注册", for: .normal)
        titleLabel?.font = .systemFont(ofSize: self.jh_getLength(length: 17))
        setTitleColor(UIColor.jh_setColor(r: 60, g: 117, b: 172), for: .normal)
        titleLabel?.textAlignment = .center
        setImage(#imageLiteral(resourceName: "areaPick_otherButton"), for: .normal)
        imageView?.contentMode = .center
        addTarget(addTargt, action: action, for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.jh_x = (imageView?.jh_x)!
        imageView?.jh_x = (titleLabel?.frame.maxX)! + 5
    }
}
