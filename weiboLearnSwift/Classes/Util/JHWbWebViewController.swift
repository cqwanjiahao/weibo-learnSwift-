//
//  JHWbWebViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/14.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbWebViewController: UIViewController {
    
    var webAdress : String?
    var backgroudColor : UIColor?
    var backgroundTitle : String?
    
    
    
    
    init(webAdress: String,title: String = "",backgroudColor: UIColor = UIColor.jh_setColor(rgb: 170),backgroundTitle: String = "") {
        super.init(nibName: nil, bundle: nil)
        self.webAdress = webAdress
        self.backgroudColor = backgroudColor
        self.backgroundTitle = backgroundTitle
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private var didSetupConstraints = false
    //MARK: - lazyload
    lazy var registWebView = UIWebView()
    lazy var backgroundView = UIView.init(lineViewColor: UIColor.jh_setColor(r: 240, g: 239, b: 244))
    lazy var topLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 225))
    lazy var backgroundLabel = { () -> UILabel in
        let backgroundLabel = UILabel()
        backgroundLabel.text = backgroundTitle
        backgroundLabel.textAlignment = .center
        backgroundLabel.font = .systemFont(ofSize: jh_getLength(length: 12))
        backgroundLabel.textColor = backgroudColor
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
extension JHWbWebViewController {
    func setupNav() {
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
        leftBtn.addTarget(self, action:  #selector(JHWbWebViewController.leftBackBtnClick), for: .touchUpInside)
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
        let registURL = URL.init(string: webAdress!)
        registWebView.loadRequest(URLRequest.init(url: registURL!))
        registWebView.backgroundColor = UIColor.clear
    }
}

// MARK:- constraints
extension JHWbWebViewController {
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
extension JHWbWebViewController {
    @objc func leftBackBtnClick() {
        navigationController?.popViewController(animated: true)
    }
}

