//
//  JHWbAreaPickOtherWebViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickOtherWebViewController: UIViewController {
    private var didSetupConstraints = false
    //MARK: - lazyload
    lazy var registWebView = UIWebView()
    lazy var backgroundView = UIView.init(lineViewColor: UIColor.jh_setColor(r: 240, g: 239, b: 244))
    lazy var topLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 225))
    lazy var backgroundLabel = { () -> UILabel in
       let backgroundLabel = UILabel()
        backgroundLabel.text = "网页由 m.weibo.cn 提供"
        backgroundLabel.textAlignment = .center
        backgroundLabel.font = .systemFont(ofSize: jh_getLength(length: 12))
        backgroundLabel.textColor = UIColor.jh_setColor(rgb: 170)
        return backgroundLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
}

// MARK:- setupView
extension JHWbAreaPickOtherWebViewController {
    func setupNav() {
        title = "注册"
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        //设置返回按钮
        let leftBtn = UIButton()
        view.addSubview(leftBtn)
        leftBtn.setTitle("返回", for: .normal)
        leftBtn.setTitleColor(.black, for: .normal)
        leftBtn.setTitleColor(UIColor.jh_setColor(r: 255, g: 130, b: 0), for: .highlighted)
        leftBtn.setImage(#imageLiteral(resourceName: "nav_backBtn"), for: .normal)
        leftBtn.setImage(#imageLiteral(resourceName: "nav_backBtn_highlighted"), for: .highlighted)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        leftBtn.sizeToFit()
        leftBtn.addTarget(self, action:  #selector(JHWbAreaPickOtherWebViewController.leftBackBtnClick), for: .touchUpInside)
        leftBtn.imageView?.snp.makeConstraints { (make) -> Void in
            make.leading.centerY.equalToSuperview()
            make.size.equalTo(jh_getsize(x: 15, y: 20))
        }
        let lefrBarBtn = UIBarButtonItem.init(customView: leftBtn)
        
        let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftNegativeSpacer.width = -10
        navigationItem.leftBarButtonItems = [leftNegativeSpacer, lefrBarBtn]
    }
    
    func setupSubView() {
        view.backgroundColor = UIColor.jh_setColor(rgb: 242)
        view.addSubview(backgroundView)
        backgroundView.addSubview(topLine)
        backgroundView.addSubview(backgroundLabel)
        view.addSubview(registWebView)
        
        let registURL = URL.init(string: "https://m.weibo.cn/reg/index?vt=4&res=wel&wm=3349&backURL=http%3A%2F%2Fm.weibo.cn%2F#email")
        registWebView.loadRequest(URLRequest.init(url: registURL!))
        registWebView.backgroundColor = UIColor.clear
    }
}

// MARK:- constraints
extension JHWbAreaPickOtherWebViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            backgroundView.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(64)
                make.width.left.equalToSuperview()
                make.height.equalTo(UIScreen.main.bounds.height - 64)
            })

            topLine.snp.makeConstraints({ (make) -> Void in
                make.top.trailing.width.equalToSuperview()
                make.height.equalTo(1)
            })

            backgroundLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 15))
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 13))
                
            })
            registWebView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(65)
                make.width.left.equalToSuperview()
                make.height.equalTo(UIScreen.main.bounds.height - 65)
            }
        }
        super .updateViewConstraints()
    }
}

// MARK: - Events
extension JHWbAreaPickOtherWebViewController {
    @objc func leftBackBtnClick() {
        navigationController?.popViewController(animated: true)
    }
}
