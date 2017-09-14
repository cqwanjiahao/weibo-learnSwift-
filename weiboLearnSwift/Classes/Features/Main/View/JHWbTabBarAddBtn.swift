//
//  JHWbTabBarAddBtn.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/14.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbTabBarAddBtn: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        self.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .selected)
        self.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        self.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .selected)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
