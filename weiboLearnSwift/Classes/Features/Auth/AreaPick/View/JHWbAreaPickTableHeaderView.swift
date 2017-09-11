//
//  JHWbAreaPickTableHeaderView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbAreaPickTableHeaderView: UIView {
    var didSetupConstraints = false
    
    lazy var bottomLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 241))
    lazy var areaLabel = { () -> UILabel in
        let arealabel = UILabel()
        arealabel.textAlignment = .left
        arealabel.textColor = UIColor.jh_setColor(rgb: 148)
        arealabel.font = .systemFont(ofSize: jh_getLength(length: 15))
        return arealabel
    }()
    public init(title: String) {
        super.init(frame: CGRect.zero)
        setupSubviews()
        areaLabel.text = title
        updateConstraints()
        setNeedsUpdateConstraints()
    }
    
    func setupSubviews() {
        backgroundColor = UIColor.jh_setColor(rgb: 242)
        addSubview(bottomLine)
        addSubview(areaLabel)
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            bottomLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.leading.width.equalToSuperview()
                make.height.equalTo(1)
            })
            
            areaLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 2))
                make.leading.equalToSuperview().offset(jh_getLength(length: 10))
                make.size.equalTo(jh_getsize(x: 200, y: 15))
            })
        }
        super.updateConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

