//
//  JHWbMainViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMainViewController: UITabBarController {
    lazy var composeButton = UIButton()
    lazy var isLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        setupComposeButton()
    }
}

// MARK:- 设置TabBarUI
extension JHWbMainViewController {

    //添加发布按钮
    func setupComposeButton() -> Void {
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .selected)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .selected)
        composeButton .sizeToFit()
        view .addSubview(composeButton)
        composeButton.center = tabBar.center
        composeButton .addTarget(self, action: #selector(JHWbMainViewController.composeButtonClick), for: .touchUpInside)
    }
}

// MARK:- 事件监听
extension JHWbMainViewController {
    @objc fileprivate func composeButtonClick() -> Void {
        print("点击了发布按钮")
        
    }
}
