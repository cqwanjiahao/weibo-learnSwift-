//
//  JHWbOtherRegistButton.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/8.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbOtherRegistButton: UIButton {
     init(title: String, image: UIImage) {
        super.init(frame: CGRect.zero)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 12))
        setTitleColor(UIColor.jh_setColor(rgb: 180), for: .normal)
        titleLabel?.textAlignment = .center
        setImage(image, for: .normal)
        imageView?.contentMode = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect.init(x: 0, y: 0, width: jh_width, height: jh_width)
        titleLabel?.frame = CGRect.init(x: 0, y: jh_width, width: jh_width, height: jh_getLength(length: 15))
    }
}
