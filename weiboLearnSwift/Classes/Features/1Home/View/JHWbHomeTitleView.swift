//
//  JHWbHomeTitleView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/18.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbHomeTitleView: UIView {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
    lazy var attentionBtn = JHWbHomeTitleBtn.init(title: "关注")
    lazy var hotTopicBtn = JHWbHomeTitleBtn.init(title: "热门")
    lazy var bottomLine = UIView.init(lineViewColor: .red)
    
    //系统回调
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
//        backgroundColor = UIColor.jh_setColor(rgb: 237)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- setupView
extension JHWbHomeTitleView {
    private func setupSubView() {
        addSubview(attentionBtn)
        addSubview(hotTopicBtn)
        addSubview(bottomLine)
        attentionBtn.tag = 0
        hotTopicBtn.tag = 1
    }
}

//MARK: - Constraint
extension JHWbHomeTitleView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            attentionBtn.snp.makeConstraints({ (make) -> Void in
                make.top.leading.equalToSuperview()
                make.size.equalTo(CGSize.init(width: jh_getLength(length: 50), height: 43))
            })
            hotTopicBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview()
                make.leading.equalTo(attentionBtn.snp.trailing).offset(jh_getLength(length: 20))
                make.size.equalTo(attentionBtn)
            })
            bottomLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.equalToSuperview().offset(-3)
                make.leading.equalTo(attentionBtn.snp.leading).offset(jh_getLength(length: 8))
                make.height.equalTo(3)
                make.width.equalTo(24)
            })
        }
        super.updateConstraints()
    }
}

