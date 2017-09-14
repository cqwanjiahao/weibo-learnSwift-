//
//  JHWbVisitorView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/30.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbVisitorView: UIView {
    //MARK: - lazyLoad
    lazy var didSetupConstraints = false
    //我:顶部框
    lazy var meHeadView = UIView()
    //#warning 后期把UIView()  改为 scrollView()
    lazy var meHeadImageView = UIImageView.init(image: #imageLiteral(resourceName: "visitorme_photo"))
    lazy var meHaedBtn = {
        () -> UIButton in
        let headButton = UIButton()
        headButton.titleLabel?.text = ""
        return headButton
    }()
    //旋转轮盘
    lazy var rotateView = UIImageView.init(image: #imageLiteral(resourceName: "visitordiscover_feed_image_smallicon"))
    //背景阴影
    lazy var shadowView = UIImageView.init(image: #imageLiteral(resourceName: "visitordiscover_feed_mask_smallicon"))
    //中心图标
    lazy var centerIconView = { () -> UIImageView in
       let centerIconView = UIImageView.init(image: #imageLiteral(resourceName: "visitordiscover_feed_image_house"))
        centerIconView.contentMode = .center
        return centerIconView
    }()
    //文字介绍
    lazy var introLabel = {
        () -> UILabel in
        let introLabel = UILabel()
        introLabel.text = "你还没有关注的人。关注自己感兴趣的人，可在这\n里看到他们发布的内容"
        introLabel.textColor = UIColor.jh_setColor(rgb: 190)
        introLabel.font = UIFont.systemFont(ofSize: jh_getLength(length: 14))
        introLabel.textAlignment = .center
        introLabel.lineBreakMode = .byWordWrapping
        introLabel.numberOfLines = 0
        return introLabel
    }()
    //首页: 中心按钮
    lazy var homeButton = JHWbVisitorButton.init(title:"找感兴趣的人",titleColor: UIColor.jh_setColor(r: 255, g: 118, b: 1))
    //消息: 注册按钮
    lazy var registBtn = JHWbVisitorButton.init(title:"注册",titleColor: UIColor.jh_setColor(r: 255, g: 118, b: 1))
    //消息: 登录按钮
    lazy var loginBtn = JHWbVisitorButton.init(title:"登录",titleColor: UIColor.jh_setColor(rgb: 140))
    //系统回调
    public init() {
        super.init(frame: CGRect.zero)
            setupSubView()
            backgroundColor = UIColor.jh_setColor(rgb: 237)
            translatesAutoresizingMaskIntoConstraints = false
        }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- setupView
extension JHWbVisitorView {
    func setupSubView() {
        addSubview(meHeadView)
        meHeadView.addSubview(meHeadImageView)
        meHeadView.addSubview(meHaedBtn)
        addSubview(rotateView)
        addSubview(shadowView)
        addSubview(centerIconView)
        addSubview(introLabel)
        addSubview(homeButton)
        addSubview(registBtn)
        addSubview(loginBtn)
    }
}

//MARK: - Constraint
extension JHWbVisitorView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            meHeadView.snp.makeConstraints({ (make) -> Void in
                make.width.equalTo(UIScreen.main.bounds.width)
                make.top.equalToSuperview().offset(64)
                make.height.equalTo(jh_getLength(length: 170))
            })
            
            meHeadImageView.snp.makeConstraints({ (make) -> Void in
                make.size.centerX.centerY.equalToSuperview()
            })
            
            meHaedBtn.snp.makeConstraints({ (make) -> Void in make.edges.equalToSuperview().inset(UIEdgeInsetsMake(jh_getLength(length: 50), jh_getLength(length: 170), jh_getLength(length: 40), jh_getLength(length: 163)))
            })
            
            introLabel.snp.makeConstraints({ (make) -> Void in make.top.equalTo(meHeadView.snp.bottom).offset(jh_getLength(length: 127))
                make.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
            })
            
            registBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(meHeadView.snp.bottom).offset(jh_getLength(length: 178))
                make.leading.equalToSuperview().offset(jh_getLength(length: 69))
                make.size.equalTo(jh_getsize(x: 127, y: 40))
            })
            
            loginBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(registBtn)
                ///此时父view的frame为0
//                make.trailing.equalToSuperview().offset(jh_getLength(length: 69))
                make.leading.equalTo(registBtn.snp.trailing).offset(jh_getLength(length: 22))
                make.size.equalTo(jh_getsize(x: 127, y: 40))
            })
            
            rotateView.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 164))
                make.leading.equalTo((UIScreen.main.bounds.size.width - 175) * 0.5)
                make.size.equalTo(CGSize.init(width: 175, height: 175))
            })
            
            shadowView.snp.makeConstraints({ (make) -> Void in
                make.top.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.bottom.equalTo(rotateView).offset(jh_getLength(length: 47))
            })
            
            centerIconView.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 220))
                make.leading.equalTo((UIScreen.main.bounds.size.width - 94) * 0.5)
                make.size.equalTo(CGSize.init(width: 94, height: 90))
            })
            
            homeButton.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(registBtn)
                make.leading.equalTo((UIScreen.main.bounds.size.width - 290) * 0.5)
                make.size.equalTo(jh_getsize(x: 290, y: 40))
            })
        }
        super.updateConstraints()
    }
}

//MARK: - 设置各个界面的方法接口
extension JHWbVisitorView {
    ///设置Home界面
    func setupHomeController() {
        meHeadView.isHidden = true
        registBtn.isHidden = true
        loginBtn.isHidden = true
        addRotateAnimate()
    }
    ///设置Message界面
    func setupMessageController() {
        meHeadView.isHidden = true
        rotateView.isHidden = true
        shadowView.isHidden = true
        homeButton.isHidden = true
        
        registBtn.isHidden = false
        loginBtn.isHidden = false
        introLabel.text = "登录后，别人评论你的微博，给你\n发消息，都会在这里收到通知"
        centerIconView.image = #imageLiteral(resourceName: "visitordiscover_image_message")
    }
    ///设置Me界面
    func setupMeController() {
        rotateView.isHidden = true
        shadowView.isHidden = true
        homeButton.isHidden = true
        centerIconView.isHidden = true
        
        meHeadView.isHidden = false
        registBtn.isHidden = false
        loginBtn.isHidden = false
        introLabel.text = "登陆后，你的微博、相册、个人资料会\n显示在这里，展示给别人"
    }
}

//MARK: - 设置旋转动画
extension JHWbVisitorView {
    func addRotateAnimate() {
        //创建动画
        let rotateAnimate = CABasicAnimation(keyPath: "transform.rotation.z")
        //动画的属性
        rotateAnimate.fromValue = 0
        rotateAnimate.toValue = Double.pi * 2
        rotateAnimate.repeatCount = MAXFLOAT
        rotateAnimate.duration = 30
        rotateAnimate.isRemovedOnCompletion = false
        //将动画添加到layer中
        rotateView.layer.add(rotateAnimate, forKey: nil)
    }
}
