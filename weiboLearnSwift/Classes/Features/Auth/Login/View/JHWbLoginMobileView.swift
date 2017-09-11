//
//  JHWbLoginMobileView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbLoginMobileView: UIView {
    private var didSetupConstraints = false
    //MARK: - lazyLoad
    //控件属性
    lazy var mobileTextField = JHWbMobileTextField.init(placeHolder: "手机号或邮箱",target: self, action:#selector(JHWbLoginMobileView.changeLoginBtnStatus))
    lazy var firstLine = UIView.init(lineViewColor: .jh_setColor(rgb: 198))
    lazy var passwordTextField = JHWbMobileTextField.init(placeHolder: "密码",target: self, action:#selector(JHWbLoginMobileView.changeLoginBtnStatus))
    lazy var secondLine = UIView.init(lineViewColor: .jh_setColor(rgb: 198))
    lazy var errorLabel = { () -> UILabel in
        let errorLabel = UILabel()
        errorLabel.isHidden = true
        errorLabel.text = "账号或密码错误"
        errorLabel.font = .systemFont(ofSize: jh_getLength(length: 15))
        errorLabel.textColor = UIColor.jh_setColor(r: 226, g: 74, b: 44)
        return errorLabel
    }()
    lazy var loginBtn = { () -> UIButton in
        let loginBtn = UIButton()
        loginBtn.isEnabled = false
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.setTitleColor(UIColor.jh_setColor(rgb: 200), for: .disabled)
        loginBtn.titleLabel?.textAlignment = .center
        loginBtn.titleLabel?.font = .systemFont(ofSize: 17)
        loginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .normal)
        loginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 223, g: 118, b: 5)), for: .highlighted)
        loginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .disabled)
        loginBtn.layer.cornerRadius = 3
        loginBtn.layer.masksToBounds = true
        loginBtn.addTarget(self, action: #selector(JHWbLoginMobileView.loginBtnClick), for: .touchUpInside)
        return loginBtn
    }()
    
    lazy var helpBtn = { () -> UIButton in
        let helpBtn = UIButton()
        helpBtn.setTitle("登录遇到问题？", for: .normal)
        helpBtn.setTitleColor(UIColor.jh_setColor(r: 80, g: 125, b: 175), for: .normal)
        helpBtn.titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 14))
        helpBtn.titleLabel?.textAlignment = .left
        return helpBtn
    }()
    
    lazy var jhLoginBtn = { () -> UIButton in
        let jhLoginBtn = UIButton()
        jhLoginBtn.setTitle("一键登录", for: .normal)
        jhLoginBtn.setTitleColor(UIColor.white, for: .normal)
        jhLoginBtn.setTitleColor(UIColor.jh_setColor(rgb: 200), for: .disabled)
        jhLoginBtn.titleLabel?.textAlignment = .center
        jhLoginBtn.titleLabel?.font = .systemFont(ofSize: 17)
        jhLoginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .normal)
        jhLoginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 223, g: 118, b: 5)), for: .highlighted)
        jhLoginBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .disabled)
        jhLoginBtn.layer.cornerRadius = 3
        jhLoginBtn.layer.masksToBounds = true
        jhLoginBtn.addTarget(self, action: #selector(JHWbLoginMobileView.jhLoginBtnClick), for: .touchUpInside)
        return jhLoginBtn
    }()
    
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
extension JHWbLoginMobileView {
    func setupSubView() {
        addSubview(mobileTextField)
        mobileTextField.addSubview(firstLine)
        addSubview(passwordTextField)
        passwordTextField.addSubview(secondLine)
        addSubview(errorLabel)
        addSubview(loginBtn)
        addSubview(helpBtn)
        addSubview(jhLoginBtn)

        passwordTextField.isSecureTextEntry = true
    }
}

// MARK:- Constraint
extension JHWbLoginMobileView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            mobileTextField.snp.makeConstraints({ (make) -> Void in
                make.top.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(jh_getLength(length: 57))
            })
            
            
            firstLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(jh_getLength(length: 20))
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(1)
            })
            
            passwordTextField.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(mobileTextField.snp.bottom)
                make.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(jh_getLength(length: 57))
            })
            
            secondLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.leading.equalTo(firstLine)
                make.height.equalTo(1)
            })
            
            errorLabel.snp.makeConstraints({ (make) -> Void in
                make.leading.equalTo(firstLine)
                make.top.equalTo(passwordTextField.snp.bottom).offset(jh_getLength(length: 13))
            })
            
            loginBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(passwordTextField.snp.bottom).offset(jh_getLength(length: 42))
                make.leading.equalTo(firstLine)
                make.width.equalTo(UIScreen.main.bounds.size.width - (2 * 20))
                make.height.equalTo(jh_getLength(length: 41))
            })
            
            helpBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(loginBtn.snp.bottom).offset(jh_getLength(length: 25))
                make.leading.equalTo(firstLine)
                make.width.equalTo(jh_getLength(length: 110))
            })
            
            jhLoginBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(loginBtn.snp.bottom).offset(jh_getLength(length: 25))
                make.width.equalTo(jh_getLength(length: 100))
                make.leading.equalTo(UIScreen.main.bounds.size.width - jh_getLength(length: 120))
            })
        }
        super.updateConstraints()
    }
}

// MARK:- Click
extension JHWbLoginMobileView {
    
    @objc func loginBtnClick() {
        errorLabel.isHidden = !errorLabel.isHidden
        jh_log(messsage: "准备发送网络请求")
    }
    
    @objc func jhLoginBtnClick() {
        mobileTextField.text = "13996381356"
        passwordTextField.text = "wjh490678868"
        changeLoginBtnStatus()
    }
    
//    @objc func mobileTextFieldEditingChanged() {
//        let length : Int = (mobileTextField.text?.characters.count)!
//        if (length >= 11 ) {
//            mobileTextField.text = (mobileTextField.text! as NSString).substring(to: 11)
//        }
//        changeLoginBtnStatus()
//    }
//    @objc func passwordTextFieldEditingChanged() {
//        let length : Int = (passwordTextField.text?.characters.count)!
//        if (length >= 11 ) {
//            passwordTextField.text = (passwordTextField.text! as NSString).substring(to: 11)
//        }
//        changeLoginBtnStatus()
//    }
     @objc func changeLoginBtnStatus() {
        if mobileTextField.hasText && passwordTextField.hasText {
            loginBtn.isEnabled = true
        } else {
            loginBtn.isEnabled = false
        }
    }
}

