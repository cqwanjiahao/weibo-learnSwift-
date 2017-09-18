//
//  JHWbHotTopictPopoverPresentationController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/18.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbHotTopictPopoverPresentationController: UIPresentationController {
    private lazy var coverView = { () -> UIView in
       let coverView = UIView.init(lineViewColor: UIColor.init(white: 0.8, alpha: 0.5))
        coverView.frame = (containerView?.bounds)!
        return coverView
    }()
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = CGRect.init(x: 0, y: 65, width: UIScreen.main.bounds.size.width, height:
            jh_getLength(length: 305))
        
        setupCoverView()
    }
}

//MARK:- SetupUI
extension JHWbHotTopictPopoverPresentationController {
    private func setupCoverView() {
        containerView?.insertSubview(coverView, at: 0)
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(JHWbHotTopictPopoverPresentationController.coverViewClick))
        coverView.addGestureRecognizer(tapGes)
    }
}

//MARK:- Events
extension JHWbHotTopictPopoverPresentationController {
    @objc private func coverViewClick() {
        presentingViewController.dismiss(animated: true, completion: nil)
        //代理? 闭包?  让按钮点击一次
        
    }
}
