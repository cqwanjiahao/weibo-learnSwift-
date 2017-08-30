//
//  JHWbVisitorView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/30.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbVisitorView: UIView {
    //MARK: - 控件的属性
    
    @IBOutlet weak var rotateView: UIImageView!
    @IBOutlet weak var shadowView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var introiLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var registButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var meHeardView: UIView!
    @IBOutlet weak var meHeardButton: UIButton!
    
    //类方法快速获取控件
    class func VisitorView() -> UIView {
        return Bundle.main.loadNibNamed("JHWbVisitorView", owner: nil, options: nil)?.first as! UIView
    }
}

//MARK: - 设置各个界面
extension JHWbVisitorView {
    ///设置Home界面
    func setupHomeController() {
        meHeardView.isHidden = true
        registButton.isHidden = true
        loginButton.isHidden = true
        addRotateAnimate()
    }
    ///设置Message界面
    func setupMessageController() {
        rotateView.isHidden = true
        shadowView.isHidden = true
        meHeardView.isHidden = true
        homeButton.isHidden = true
        
        registButton.isHidden = false
        loginButton.isHidden = false
        introiLabel.text = "登录后，别人评论你的微博，给你发消息，都会在这里收到通知"
        iconView.image = #imageLiteral(resourceName: "visitordiscover_image_message")
    }
    ///设置Me界面
    func setupMeController() {
        rotateView.isHidden = true
        shadowView.isHidden = true
        iconView.isHidden = true
        homeButton.isHidden = true
        
        meHeardView.isHidden = false
        registButton.isHidden = false
        loginButton.isHidden = false
        introiLabel.text = "登陆后，你的微博、相册、个人资料会显示在这里，展示给别人"
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
        rotateAnimate.duration = 5
        rotateAnimate.isRemovedOnCompletion = false
        //将动画添加到layer中
        rotateView.layer.add(rotateAnimate, forKey: nil)
    }
}

