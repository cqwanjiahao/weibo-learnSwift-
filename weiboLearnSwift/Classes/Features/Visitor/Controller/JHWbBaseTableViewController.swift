//
//  JHWbBaseTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/30.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbBaseTableViewController: UITableViewController {
    //MARK: - lazyload
    lazy var visitorView = JHWbVisitorView()
    lazy var isLogin = false
    private var didSetupConstraints = false
    lazy var topLine = {() -> UIView in
        let topLine = UIView()
        topLine.backgroundColor = UIColor.jh_setColor(rgb: 221)
        return topLine
    }()
    
    //系统回调
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
}

// MARK:- setupView
extension JHWbBaseTableViewController {
    @objc func setupSubView() {
        view .addSubview(topLine)
        topLine.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 1)
    }
    
    private func setupVisitorView() {
        view = visitorView
        setupNavigationBar()
        ///监听按钮点击
        visitorView.registButton.addTarget(self, action: #selector(JHWbBaseTableViewController.rigisetButtonClick), for: .touchUpInside)
        visitorView.loginButton.addTarget(self, action: #selector(JHWbBaseTableViewController.loginButtonClick), for: .touchUpInside)
        visitorView.meHaedButton.addTarget(self, action: #selector(JHWbBaseTableViewController.loginButtonClick), for: .touchUpInside)
    }
    
    /// 设置导航栏左右的Item
    @objc func setupNavigationBar() {
        let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftNegativeSpacer.width = -10
        let leftButton = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.rigisetButtonClick))
        navigationItem.leftBarButtonItems = [leftNegativeSpacer, leftButton]
        let rightNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightNegativeSpacer.width = -10
        let rightButton = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.loginButtonClick))
        navigationItem.rightBarButtonItems = [rightNegativeSpacer, rightButton]
    }
}

// MARK:- constraints
extension JHWbBaseTableViewController {
//    override func updateViewConstraints() {
//        if !didSetupConstraints {
//            didSetupConstraints = true
//
//            visitorView.snp.makeConstraints { (make) -> Void in
//                make.size.equalTo(view)
//                make.center.equalTo(view)
//            }
//
//            topLine.snp.makeConstraints { (make) -> Void in
////                make.left.equalTo(view)
////                make.right.equalTo(view)
//                make.height.equalTo(50)
////                make.top.equalTo(64)
//                make.width.height.equalTo(50)
//                make.center.equalTo(self.view)
//            }
//        }
//        super .updateViewConstraints()
//    }
}

// MARK:- Click
extension JHWbBaseTableViewController {
    @objc private func rigisetButtonClick() {
        let registNav = UINavigationController.init(rootViewController: JHWbLoginViewController())
        present(registNav, animated: true) {
        }
    }
    @objc private func loginButtonClick() {
        print("loginBtnClick")
    }
}
