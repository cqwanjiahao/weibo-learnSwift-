//
//  JHWbRegistViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbRegistViewController: UIViewController,JHWbMoblieRegistViewDelegate {
    private var didSetupConstraints = false
    //MARK: - lazyload
    lazy var mainScrollView = { () -> UIScrollView in
        let mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = UIColor.white
        mainScrollView.contentSize = CGSize.init(width: 0, height: UIScreen.main.bounds.size.height - 19)
        return mainScrollView
    }()
    
    lazy var cancelBtn = { () -> UIButton in
       let cancelBtn = UIButton()
        cancelBtn.setTitleColor(UIColor.black, for: .normal)
        cancelBtn.setTitleColor(UIColor.jh_setColor(r: 255, g: 133, b: 5), for: .highlighted)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.titleLabel?.font = .systemFont(ofSize: jh_getLength(length: 16))
        cancelBtn .sizeToFit()
        cancelBtn.addTarget(self, action: #selector(JHWbRegistViewController.cancelButtonClick), for: .touchUpInside)
        return cancelBtn
    }()
    
    lazy var infoLabel = { () -> UILabel in
        let infoLabel = UILabel()
        infoLabel.text = "输入手机号，快速注册"
        infoLabel.textColor = UIColor.black
        infoLabel.font = .systemFont(ofSize: jh_getLength(length: 24))
        infoLabel.textAlignment = .center
        return infoLabel
    }()
    
    lazy var mobileRegistView = JHWbMoblieRegistView()
        lazy var otherRegistView = JHWbOtherRegistView()
    
    
    
    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        mobileRegistView.delegate = self
        addAGesutreRecognizerForScrollView()
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
extension JHWbRegistViewController {
    func setupSubView() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(cancelBtn)
        mainScrollView.addSubview(infoLabel)
        mainScrollView.addSubview(mobileRegistView)
        mainScrollView.addSubview(otherRegistView)
    }
}


// MARK:- constraints
extension JHWbRegistViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true

            mainScrollView.snp.makeConstraints { (make) -> Void in
                make.size.equalToSuperview()
                make.center.equalToSuperview()
            }

            cancelBtn.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 15))
                make.leading.equalToSuperview().offset(jh_getLength(length: 10))
                make.height.equalTo(jh_getLength(length: 16))
            }
            
            infoLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 80))
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 24))
            }

            mobileRegistView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(infoLabel.snp.bottom).offset(jh_getLength(length: 53))
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 250))
            }

            otherRegistView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(UIScreen.main.bounds.height - 100 - 20)
                make.width.leading.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 100))
            }
        }
        super .updateViewConstraints()
    }
}

// MARK: - Events
extension JHWbRegistViewController {
    @objc func cancelButtonClick() {
        dismiss(animated: true) {
        }
    }
    

//    退出键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mobileRegistView.mobileTextField.resignFirstResponder()
    }
    //MARK : 给scrollView添加手势
    func addAGesutreRecognizerForScrollView() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action:#selector(JHWbRegistViewController.tapGestureClick))
        mainScrollView.addGestureRecognizer(tapGesture)
    }
    @objc func tapGestureClick(recognizer : UITapGestureRecognizer) {        mobileRegistView.mobileTextField.resignFirstResponder()
    }
    //swift4 中无法重写 这个方法
    //        mainScrollView.hitTest(<#T##point: CGPoint##CGPoint#>, with: <#T##UIEvent?#>)
    //        mainScrollView.point(inside: <#T##CGPoint#>, with: <#T##UIEvent?#>)
    //    override func hitTest(_ point: CGPoint, with event: UIEvent?) {
    //        return mainScrollView
    //    }
}

extension JHWbRegistViewController {
    func areaPickBtnClick() {
        navigationController?.pushViewController(JHWbAreaPickTableViewController.init(style: .plain), animated: true)
    }
}
