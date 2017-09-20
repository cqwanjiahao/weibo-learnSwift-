//
//  JHWbComposeViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

/// 取消按钮改为一张图,图片旋转 ,图标向上滑动
import UIKit

class JHWbComposeViewController: UIViewController {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
    private lazy var timeView  = JHWbComposeTimeView()
    private lazy var mainScrollView = { () -> UIScrollView in
    let mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = .blue
        return mainScrollView
    }()
    private lazy var pageView = UIPageControl()
    private lazy var cancelBtn = { () -> UIButton in
        let cancelBtn = UIButton()
        cancelBtn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_cancel"), for: .normal)
        cancelBtn.imageView?.center = cancelBtn.center
        return cancelBtn 
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cancelBtnClick()
    }
}

//MARK: - UI
extension JHWbComposeViewController {
    func setupSubView() {
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.95)
        view.addSubview(timeView)
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(pageView)
        view.addSubview(cancelBtn)
    }
}

//MARK: - Constraint
extension JHWbComposeViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            timeView.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(50)
                make.leading.width.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 100))
            })
            mainScrollView.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(timeView.snp.bottom)
                make.leading.width.equalToSuperview()
                make.bottom.equalTo(cancelBtn.snp.bottom).offset(-46)
            })
            pageView.snp.makeConstraints({ (make) -> Void in
                make.leading.width.equalToSuperview()
                make.bottom.equalTo(cancelBtn.snp.bottom).offset(-46)
                make.height.equalTo(jh_getLength(length: 50))
                
            })
            cancelBtn.snp.makeConstraints({ (make) -> Void in
                make.bottom.leading.width.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 46))
            })
        }
        super.updateViewConstraints()
    }
}

// MARK:- Evens
extension JHWbComposeViewController {
    private func cancelBtnClick() {
    dismiss(animated: true, completion: nil)
    }
}
