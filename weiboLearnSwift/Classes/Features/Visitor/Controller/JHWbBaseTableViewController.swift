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
    //    lazy var isLogin = true
    private var didSetupConstraints = false
    private lazy var topLine = {() -> UIView in
        let topLine = UIView()
        topLine.backgroundColor = UIColor.jh_setColor(rgb: 221)
        topLine.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        return topLine
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isLogin {
            setupVisitorView()
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        tableView.separatorStyle = .none
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    private func setupVisitorView() {
//        view = visitorView
        view.addSubview(visitorView)
        ///监听按钮点击
        visitorView.registBtn.addTarget(self, action: #selector(JHWbBaseTableViewController.registBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(JHWbBaseTableViewController.loginBtnClick), for: .touchUpInside)
        visitorView.meHaedBtn.addTarget(self, action: #selector(JHWbBaseTableViewController.loginBtnClick), for: .touchUpInside)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        hidesBottomBarWhenPushed = true
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        hidesBottomBarWhenPushed = false
//    }
}

// MARK:- setupView
extension JHWbBaseTableViewController {
    @objc  func setupSubView() {
        setupNavigationBar()
        view .addSubview(topLine)
    }
    /// 设置导航栏左右的Item
    @objc func setupNavigationBar() {
        let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftNegativeSpacer.width = -10
        let leftButton = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.registBtnClick))
        navigationItem.leftBarButtonItems = [leftNegativeSpacer, leftButton]
        let rightNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightNegativeSpacer.width = -10
        let rightButton = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(JHWbBaseTableViewController.loginBtnClick))
        navigationItem.rightBarButtonItems = [rightNegativeSpacer, rightButton]
    }
    

}

 //MARK:- constraints
extension JHWbBaseTableViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            if !isLogin {
            visitorView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(view)
                make.center.equalTo(view)
                }
            }
        }
        super .updateViewConstraints()
    }
}

// MARK:- Click
extension JHWbBaseTableViewController {
    @objc private func registBtnClick() {
        let registNav = UINavigationController.init(rootViewController: JHWbRegistViewController())
        present(registNav, animated: true) {
        }
    }
    
    @objc private func loginBtnClick() {
        let loginNav = UINavigationController.init(rootViewController: JHWbLoginViewController())
        present(loginNav, animated: true) {
        }
    }
}

//MARK:- 拓展:当需要直接替代view的时候,调用一下方法
///如果直接替代:需要重写viewWillLayoutSubviews方法     尽量不使用,直接分两个类情况分别处理

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        view.updateConstraints()
//        view.setNeedsUpdateConstraints()
//    }
