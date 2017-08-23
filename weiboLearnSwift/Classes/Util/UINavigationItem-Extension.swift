//
//  UINavigationItem-Extension.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName : String) {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        button.sizeToFit()
        
        self.init(customView: button)
    }
}
