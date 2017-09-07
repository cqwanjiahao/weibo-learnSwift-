//
//  JHWbVisitorButton.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/8.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbVisitorButton: UIButton {
   public init(title: String, titleColor: UIColor) {
    super.init(frame: CGRect.zero)
    setTitle(title, for: .normal)
    titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 16))
    setTitleColor(titleColor, for: .normal)
    setBackgroundImage(#imageLiteral(resourceName: "common_button_white_disable"), for: .normal)
//    setBackgroundImage(#imageLiteral(resourceName: "common_button_white_disable"), for: .highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
