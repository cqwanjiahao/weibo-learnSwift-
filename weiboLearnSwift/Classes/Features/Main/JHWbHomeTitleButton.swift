//
//  JHWbHomeTitleButton.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbHomeTitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), for: .normal)
        setImage(#imageLiteral(resourceName: "navigationbar_arrow_down"), for: .selected)
        setTitleColor(UIColor.black, for: .normal)
        jh_log(messsage: "tset")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
