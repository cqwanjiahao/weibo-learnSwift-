//
//  JHWbAreaPickViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/11.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickViewController: UIViewController {
    private var didSetupConstraints = false
    //MARK: - lazyload
    lazy var areaPickTableVC = JHWbAreaPickTableViewController()
    lazy var areaPickView = UIView()
    lazy var otherAreaBtn = JHWbAreaPickOtherAreaBtn.init(addTargt: self, action: #selector(JHWbAreaPickViewController.otherAreaBtnClick))
    lazy var otherAreaFirstLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 186))
    lazy var otherAreaSecondLine = UIView.init(lineViewColor: UIColor.jh_setColor(rgb: 251))
    
    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupChildVC()
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
        adjustOtherAreaBtnFrame()
    }
}

// MARK:- setupView
extension JHWbAreaPickViewController {
    func setupNav() {
        title = "选择国家/地区"
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
        leftBtn.addTarget(self, action:  #selector(JHWbAreaPickViewController.leftBackBtnClick), for: .touchUpInside)
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
        view.addSubview(areaPickView)
        areaPickView.addSubview(areaPickTableVC.view)
        view.addSubview(otherAreaBtn)
        otherAreaBtn.addSubview(otherAreaFirstLine)
        otherAreaBtn.addSubview(otherAreaSecondLine)
    }
    
    func setupChildVC() {
        addChildViewController(areaPickTableVC)
    }
    
    func adjustOtherAreaBtnFrame() {
        otherAreaBtn.titleLabel?.frame = CGRect.init(x: 0, y: otherAreaBtn.jh_width, width: otherAreaBtn.jh_width, height: jh_getLength(length: 17))
        otherAreaBtn.imageView?.frame = CGRect.init(x: 0, y: 0, width: jh_getLength(length: 17), height: jh_getLength(length: 17))
    }
}

// MARK:- constraints
extension JHWbAreaPickViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            areaPickView.snp.makeConstraints { (make) -> Void in
                make.top.leading.width.equalToSuperview()
                make.height.equalTo(UIScreen.main.bounds.size.height - 55)
            }
            
            areaPickTableVC.view.snp.makeConstraints({ (make) -> Void in
                make.size.equalToSuperview()
                make.center.equalToSuperview()
            })
            
            otherAreaBtn.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(areaPickView.snp.bottom)
                make.leading.width.equalToSuperview()
                make.height.equalTo(55)
            }
            
            otherAreaFirstLine.snp.makeConstraints({ (make) -> Void in
                make.top.leading.width.equalToSuperview()
                make.height.equalTo(1)
            })
            otherAreaSecondLine.snp.makeConstraints({ (make) -> Void in
                make.leading.width.equalToSuperview()
                make.top.equalToSuperview().offset(1)
                make.height.equalTo(1)
            })
        }
        super .updateViewConstraints()
    }
}

// MARK: - Events
extension JHWbAreaPickViewController {
    @objc func leftBackBtnClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func otherAreaBtnClick() {
        navigationController?.pushViewController(JHWbAreaPickOtherWebViewController(), animated: true)

    }
}
