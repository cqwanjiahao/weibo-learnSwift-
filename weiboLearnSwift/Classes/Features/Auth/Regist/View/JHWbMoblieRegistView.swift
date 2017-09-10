//
//  JHWbMoblieRegistView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/8.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
protocol JHWbMoblieRegistViewDelegate :NSObjectProtocol {
    //代理方法
    func areaPickBtnClick()
}

class JHWbMoblieRegistView: UIView {
    var delegate : JHWbMoblieRegistViewDelegate?
    
    //MARK: - lazyLoad
    lazy var didSetupConstraints = false
    
    
    //控件属性
    lazy var areaPickBtn = { () -> UIButton in
       let areaPickBtn = UIButton()
        areaPickBtn.setTitle("中国 +86", for: .normal)
        areaPickBtn.setTitleColor(.black, for: .normal)
        areaPickBtn.titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 17))
        areaPickBtn.titleLabel?.textAlignment = .left
        areaPickBtn.contentHorizontalAlignment = .left
        areaPickBtn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        areaPickBtn.setBackgroundImage(jh_createStretchImageWithColor(color: .jh_setColor(rgb: 255)), for: .normal)
        areaPickBtn.setBackgroundImage(jh_createStretchImageWithColor(color: .jh_setColor(rgb: 241)), for: .highlighted)
        areaPickBtn.addTarget(self, action: #selector(JHWbMoblieRegistView.areaPickBtnClick), for: .touchUpInside)
        return areaPickBtn
    }()
    lazy var areaPickIcon = UIImageView.init(image: #imageLiteral(resourceName: "login_button"))
    lazy var firstLine = UIView.init(lineViewColor: .jh_setColor(rgb: 198))
    lazy var mobileTextField = JHWbMobileTextField.init(target: self, action:#selector(JHWbMoblieRegistView.mobileTextFieldEditingChanged))
    lazy var secondLine = UIView.init(lineViewColor: .jh_setColor(rgb: 198))
    lazy var errorLabel = { () -> UILabel in
       let errorLabel = UILabel()
        errorLabel.isHidden = true
        errorLabel.text = "你的手机号输入有误(-103)"
        errorLabel.font = .systemFont(ofSize: jh_getLength(length: 15))
        errorLabel.textColor = UIColor.jh_setColor(r: 226, g: 74, b: 44)
        return errorLabel
    }()
    lazy var registBtn = { () -> UIButton in
        let registBtn = UIButton()
        registBtn.isEnabled = false
        registBtn.setTitle("注册", for: .normal)
        registBtn.setTitleColor(UIColor.white, for: .normal)
        registBtn.setTitleColor(UIColor.jh_setColor(rgb: 200), for: .disabled)
        registBtn.titleLabel?.textAlignment = .center
        registBtn.titleLabel?.font = .systemFont(ofSize: 17)
        registBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .normal)
        registBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 223, g: 118, b: 5)), for: .highlighted)
        registBtn.setBackgroundImage( jh_createStretchImageWithColor(color: .jh_setColor(r: 255, g: 133, b: 5)), for: .disabled)
        registBtn.layer.cornerRadius = 3
        registBtn.layer.masksToBounds = true
        registBtn.addTarget(self, action: #selector(JHWbMoblieRegistView.registBtnClick), for: .touchUpInside)
        return registBtn
    }()
    lazy var lawLabel = { () -> UILabel in
        let lawLabel = UILabel()
        let attrStrM = NSMutableAttributedString()
        let str1 = NSAttributedString.init(string: "注册代表你同意", attributes: [NSAttributedStringKey.foregroundColor : UIColor.jh_setColor(rgb: 131)])
        let str2 = NSAttributedString.init(string: "隐私条款", attributes: [NSAttributedStringKey.foregroundColor : UIColor.jh_setColor(r: 80, g: 125, b: 175)])
        let str3 = NSAttributedString.init(string: "和", attributes: [NSAttributedStringKey.foregroundColor : UIColor.jh_setColor(rgb: 131)])
        let str4 = NSAttributedString.init(string: "微博服务使用协议", attributes: [NSAttributedStringKey.foregroundColor : UIColor.jh_setColor(r: 80, g: 125, b: 175)])
        attrStrM.append(str1)
        attrStrM.append(str2)
        attrStrM.append(str3)
        attrStrM.append(str4)
        lawLabel.attributedText = attrStrM
        lawLabel.font = .systemFont(ofSize: 14)
        return lawLabel
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
extension JHWbMoblieRegistView {
    func setupSubView() {
        addSubview(areaPickBtn)
        areaPickBtn.addSubview(areaPickIcon)
        areaPickBtn.addSubview(firstLine)
        addSubview(mobileTextField)
        mobileTextField.addSubview(secondLine)
        addSubview(errorLabel)
        addSubview(registBtn)
        addSubview(lawLabel)
    }
}

// MARK:- Constraint
extension JHWbMoblieRegistView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            areaPickBtn.snp.makeConstraints({ (make) -> Void in
                make.top.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(jh_getLength(length: 55))
            })
            
            areaPickIcon.snp.makeConstraints({ (make) -> Void in
                make.leading.equalTo(UIScreen.main.bounds.size.width - jh_getLength(length: 22 + 12))
                make.centerY.equalToSuperview()
                make.size.equalTo(jh_getsize(x: 12, y: 12))
            })
            
            firstLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(jh_getLength(length: 20))
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(1)
            })

            mobileTextField.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(areaPickBtn.snp.bottom)
                make.leading.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.height.equalTo(jh_getLength(length: 55))
            })
            
            secondLine.snp.makeConstraints({ (make) -> Void in
                make.bottom.equalToSuperview()
                make.width.equalTo(UIScreen.main.bounds.size.width)
                make.leading.equalTo(firstLine)
                make.height.equalTo(1)
            })

            errorLabel.snp.makeConstraints({ (make) -> Void in
                make.leading.equalTo(firstLine)
                make.top.equalTo(mobileTextField.snp.bottom).offset(jh_getLength(length: 13))
            })
            registBtn.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(mobileTextField.snp.bottom).offset(jh_getLength(length: 60))
                make.leading.equalTo(firstLine)
                make.width.equalTo(UIScreen.main.bounds.size.width - (2 * 20))
                make.height.equalTo(jh_getLength(length: 41))
            })
            
            lawLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(registBtn.snp.bottom).offset(jh_getLength(length: 25))
                make.leading.equalTo(firstLine)
                make.width.equalTo(UIScreen.main.bounds.size.width)
            })
        }
        super.updateConstraints()
    }
}

// MARK:- Click
extension JHWbMoblieRegistView {

    @objc func registBtnClick() {
        errorLabel.isHidden = !errorLabel.isHidden
        jh_log(messsage: "准备发送网络请求")
    }
    
    @objc func areaPickBtnClick() {
        if (delegate != nil) {
            delegate?.areaPickBtnClick()
        }
        
        //        let areaPickstoryboard = UIStoryboard.init(name: "JHWbAreaPickTableViewController", bundle: nil)
//        let areaPickVC : JHWbAreaPickTableViewController = areaPickstoryboard.instantiateInitialViewController() as! JHWbAreaPickTableViewController
//        navigationController?.pushViewController(areaPickVC, animated: true)
//        jh_log(messsage: "使用闭包 传到控制器")
    }
    @objc func mobileTextFieldEditingChanged() {
        let length : Int = (mobileTextField.text?.characters.count)!
        if (length >= 11 ) {
            mobileTextField.text = (mobileTextField.text! as NSString).substring(to: 11)
        }

        if mobileTextField.hasText {
            registBtn.isEnabled = true
        } else {
            registBtn.isEnabled = false
        }
    }
    
}

extension JHWbMoblieRegistView {
    
}

