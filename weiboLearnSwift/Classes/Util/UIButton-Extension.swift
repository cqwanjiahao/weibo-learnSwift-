//
//  UIButton-Extension.swift
//  weiboLearnSwift
//
//  Created by 家豪万 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

extension UIButton {

    convenience init(image:String) {
        self.init()
        setImage(UIImage(named: image), for: .normal)
        setImage(UIImage(named: image + "_highlighted"), for: .selected)
        sizeToFit()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
