//
//  JHWbBaseTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/27.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
class JHWbBaseTableViewController: UITableViewController {
    //MARK: - 定义变量
    var isLogin = false
    
    //MARK: - lazyload
    lazy var visitorView : JHWbVisitorView = JHWbVisitorView.VisitorView() as! JHWbVisitorView
    
    //MARK: - 系统回调
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
}

extension JHWbBaseTableViewController {
   private func setupVisitorView() {
    view = visitorView
    setupNavigationBar()
    
    ///监听按钮点击
    visitorView.registButton.addTarget(self, action: #selector(JHWbBaseTableViewController.rigisetButtonClick), for: .touchUpInside)
    visitorView.loginButton.addTarget(self, action: #selector(JHWbBaseTableViewController.loginButtonClick), for: .touchUpInside)
    visitorView.meHeardButton.addTarget(self, action: #selector(JHWbBaseTableViewController.loginButtonClick), for: .touchUpInside)
    }
    
    
    
    
    /// 设置导航栏左右的Item
  func setupNavigationBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.rigisetButtonClick))
    navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.loginButtonClick))
    }
}

// MARK:- 事件监听
extension JHWbBaseTableViewController {
    @objc private func rigisetButtonClick() {
        print("registerBtnClick")
    }
    
    @objc private func loginButtonClick() {
        print("loginBtnClick")
    }
}

