//
//  JHWbLoginViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SVProgressHUD

class JHWbLoginViewController: UIViewController {
    private var didSetupConstraints = false

    //MARK: - lazyload
    lazy var cancelBtn = { () -> UIButton in
        let cancelBtn = UIButton()
        cancelBtn.setTitleColor(UIColor.black, for: .normal)
        cancelBtn.setTitleColor(UIColor.jh_setColor(r: 255, g: 133, b: 5), for: .highlighted)
        cancelBtn.setTitle("关闭", for: .normal)
        cancelBtn.titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 16))
        cancelBtn .sizeToFit()
        cancelBtn.addTarget(self, action: #selector(JHWbLoginViewController.cancelBtnClick), for: .touchUpInside)
        return cancelBtn
    }()
    
    lazy var registBtn = { () -> UIButton in
        let cancelBtn = UIButton()
        cancelBtn.setTitleColor(UIColor.black, for: .normal)
        cancelBtn.setTitleColor(UIColor.jh_setColor(r: 255, g: 133, b: 5), for: .highlighted)
        cancelBtn.setTitle("注册", for: .normal)
        cancelBtn.titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 16))
        cancelBtn .sizeToFit()
        cancelBtn.addTarget(self, action: #selector(JHWbLoginViewController.registBtnClick), for: .touchUpInside)
        return cancelBtn
    }()
    
    lazy var centerIconView = UIImageView.init(image: #imageLiteral(resourceName: "login_picture"))
    
    lazy var mobileLoginView = JHWbLoginMobileView()
    lazy var otherLoginView = JHWbOtherRegistView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        otherLoginEvents()
//        addAGesutreRecognizerForScrollView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK:- setupView
extension JHWbLoginViewController {
    func setupSubView() {
        view.backgroundColor = .white
        view.addSubview(cancelBtn)
        view.addSubview(registBtn)
        view.addSubview(centerIconView)
        view.addSubview(mobileLoginView)
        view.addSubview(otherLoginView)
        mobileLoginView.helpBtn.addTarget(self, action: #selector(JHWbLoginViewController.helpBtnClick), for: .touchUpInside)
    }
}

// MARK:- constraints
extension JHWbLoginViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            cancelBtn.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 15) + 20)
                make.leading.equalToSuperview().offset(jh_getLength(length: 10))
                make.size.equalTo(jh_getsize(x: 35, y: 16))
            }
            
            registBtn.snp.makeConstraints { (make) -> Void in
                make.top.size.equalTo(cancelBtn)
                make.leading.equalToSuperview().offset(UIScreen.main.bounds.size.width - jh_getLength(length: 45))
            }
            
            centerIconView.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 67) + 20)
                make.centerX.equalToSuperview()
                make.size.equalTo(jh_getsize(x: 85, y: 85))
            }
            
            mobileLoginView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(centerIconView.snp.bottom).offset(jh_getLength(length: 18))
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 250))
            }
            
            otherLoginView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(UIScreen.main.bounds.height - 100)
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 100))
            }
        }
        super .updateViewConstraints()
    }
}

//MARK:- Events
extension JHWbLoginViewController {
    func otherLoginEvents() {
        otherLoginView.qqBtn.addTarget(self, action: #selector(JHWbRegistViewController.qqBtnClick), for: .touchUpInside)
        otherLoginView.wechatBtn.addTarget(self, action: #selector(JHWbRegistViewController.wechatBtnClick), for: .touchUpInside)
        otherLoginView.mailBtn.addTarget(self, action: #selector(JHWbRegistViewController.mailBtnClick), for: .touchUpInside)
    }
    
    @objc func qqBtnClick() {
        SVProgressHUD.show(withStatus: "QQ暂未完成")
        SVProgressHUD.dismiss(withDelay: 2)
    }
    @objc func wechatBtnClick() {
        SVProgressHUD.show(withStatus: "微信暂未完成")
        SVProgressHUD.dismiss(withDelay: 2)
    }
    @objc func mailBtnClick() {
        SVProgressHUD.show(withStatus: "邮箱暂未完成")
        SVProgressHUD.dismiss(withDelay: 2)
    }
    
    @objc func cancelBtnClick() {
        dismiss(animated: true) {
        }
    }
    
    @objc func registBtnClick() {
        let registNav = UINavigationController.init(rootViewController: JHWbRegistViewController())
        present(registNav, animated: true) {
        }
    }
    
    //    退出键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mobileLoginView.mobileTextField.resignFirstResponder()
        mobileLoginView.passwordTextField.resignFirstResponder()
    }
//    //MARK : 给scrollView添加手势
//    func addAGesutreRecognizerForScrollView() {
//        let tapGesture = UITapGestureRecognizer.init(target: self, action:#selector(JHWbRegistViewController.tapGestureClick))
//        mainScrollView.addGestureRecognizer(tapGesture)
//    }
//    @objc func tapGestureClick(recognizer : UITapGestureRecognizer) {        mobileRegistView.mobileTextField.resignFirstResponder()
//    }
    
    @objc func helpBtnClick() {
        
        // 非常丑 ......自定义
        //弹出一个tableView即可
        
        //创建alertView
        let helpAlertVC = UIAlertController.init(title: "", message: "", preferredStyle: .actionSheet)
        let findPassWord = UIAlertAction.init(title: "找回密码", style: .default) {
            (action: UIAlertAction) -> Void in
            self.jh_log(messsage: "点击了 找回密码")
        }
        let findAccount = UIAlertAction.init(title: "找回登录名", style: .default) {
            (action: UIAlertAction) -> Void in
            self.jh_log(messsage: "点击了 找回登录名")
        }
        let serviceCenter = UIAlertAction.init(title: "客服中心", style: .default) {
            (action: UIAlertAction) -> Void in
            self.jh_log(messsage: "点击了 客服中心")
        }
        helpAlertVC.addAction(findPassWord)
        helpAlertVC.addAction(findAccount)
        helpAlertVC.addAction(serviceCenter)
        present(helpAlertVC, animated: true, completion: nil)
    }
}
