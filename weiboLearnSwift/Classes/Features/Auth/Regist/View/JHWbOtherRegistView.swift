//
//  JHWbOtherRegistView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/8.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbOtherRegistView: UIView {
    //MARK: - lazyLoad
    lazy var didSetupConstraints = false
    //控件属性
    lazy var infoLabel = { () -> UILabel in
    let introLabel = UILabel()
    introLabel.text = "其他方式注册"
    introLabel.textColor = UIColor.jh_setColor(rgb: 198)
    introLabel.font = UIFont.systemFont(ofSize: jh_getLength(length: 14))
    introLabel.textAlignment = .center
    return introLabel
    }()
    lazy var leftLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 198))
    lazy var rightLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 198))
    lazy var wechatBtn = JHWbOtherRegistButton.init(title: "微信", image: #imageLiteral(resourceName: "login_weixin"))
    lazy var qqBtn = JHWbOtherRegistButton.init(title: "QQ", image: #imageLiteral(resourceName: "login_qq"))
    lazy var mailBtn = JHWbOtherRegistButton.init(title: "邮箱", image: #imageLiteral(resourceName: "login_mail"))
    
    //系统回调
    public init() {
        super.init(frame: CGRect.zero)
        setupSubView()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- setupView
extension JHWbOtherRegistView {
    func setupSubView() {
        addSubview(infoLabel)
        addSubview(leftLine)
        addSubview(rightLine)
        addSubview(wechatBtn)
        addSubview(qqBtn)
        addSubview(mailBtn)
    }
}

// MARK:- Constraint
extension JHWbOtherRegistView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            infoLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 2))
                make.centerX.equalToSuperview()
                make.size.equalTo(jh_getsize(x: 90, y: 14))
            })
            
            leftLine.snp.makeConstraints({ (make) -> Void in
                make.leading.equalToSuperview().offset(jh_getLength(length: 30))
                make.trailing.equalTo(infoLabel.snp.leading).offset(jh_getLength(length: -2))
                make.centerY.equalTo(infoLabel)
                make.height.equalTo(1)
            })
            
            rightLine.snp.makeConstraints({ (make) -> Void in
                make.leading.equalTo(infoLabel.snp.trailing).offset(jh_getLength(length: 4))
                make.width.equalTo(leftLine)
//                make.l.equalToSuperview().offset(UIScreen.main.bounds.size.width - jh_getLength(length: -30))
                make.centerY.equalTo(infoLabel)
                make.height.equalTo(1)
            })

            qqBtn.snp.makeConstraints({ (make) -> Void in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(jh_getLength(length: 25))
                make.size.equalTo(jh_getsize(x: 45, y: 60))
            })
            
            wechatBtn.snp.makeConstraints({ (make) -> Void in
                make.centerY.size.equalTo(qqBtn)
                make.leading.equalTo((UIScreen.main.bounds.size.width - 3 * 45) * 0.25)
            })
            mailBtn.snp.makeConstraints({ (make) -> Void in
                make.centerY.size.equalTo(qqBtn)
                make.leading.equalTo(qqBtn.snp.trailing).offset((UIScreen.main.bounds.size.width - 3 * 45) * 0.25)
            })
        }
        super.updateConstraints()
    }
}
