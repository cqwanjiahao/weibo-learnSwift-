//
//  JHWbBaseViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/30.
//  Copyright © 2017年 万家豪. All rights reserved.
//
import UIKit
import SnapKit

class JHWbBaseViewController: UIViewController {
    lazy var visitorView = JHWbVisitorView()
    lazy var isLogin = false
//    lazy var isLogin = true
    private var didSetupConstraints = false
    private lazy var topLine = {() -> UIView in
        let topLine = UIView()
        topLine.backgroundColor = UIColor.jh_setColor(rgb: 221)
        return topLine
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
}

// MARK:- setupView
extension JHWbBaseViewController {
    @objc  func setupSubView() {
        view.backgroundColor = UIColor.jh_setColor(rgb: 237)
        navigationController?.navigationBar.backgroundColor = .white
        view .addSubview(topLine)
        setupVisitorView()
        setupNavigationBar()
    }
    
    private func setupVisitorView() {
        //        view = visitorView
        view.addSubview(visitorView)
        visitorView.registBtn.addTarget(self, action: #selector(JHWbBaseViewController.registBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(JHWbBaseViewController.loginBtnClick), for: .touchUpInside)
        visitorView.meHaedBtn.addTarget(self, action: #selector(JHWbBaseViewController.loginBtnClick), for: .touchUpInside)
    }
    
    /// 设置导航栏左右的Item
    @objc func setupNavigationBar() {
        let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftNegativeSpacer.width = -10
        let leftButton = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action: #selector(JHWbBaseViewController.registBtnClick))
        navigationItem.leftBarButtonItems = [leftNegativeSpacer, leftButton]
        let rightNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        rightNegativeSpacer.width = -10
        let rightButton = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action: #selector(JHWbBaseViewController.loginBtnClick))
        navigationItem.rightBarButtonItems = [rightNegativeSpacer, rightButton]
    }
}

//MARK:- constraints
extension JHWbBaseViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            if !isLogin {
                topLine.snp.makeConstraints({ (make) -> Void in
                    make.top.trailing.width.equalToSuperview()
                    make.height.equalTo(1)
                })
                visitorView.snp.makeConstraints({ (make) -> Void in
                    make.top.equalTo(64)
                    make.height.equalTo(UIScreen.main.bounds.size.height - 64)
                    make.trailing.width.equalToSuperview()
                })
            }
        super .updateViewConstraints()
        }
    }
}

// MARK:- Click
extension JHWbBaseViewController {
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
