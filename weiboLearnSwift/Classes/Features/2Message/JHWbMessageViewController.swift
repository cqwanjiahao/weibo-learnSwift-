//
//  JHWbMessageViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMessageViewController: JHWbBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
}

// MARK:- setupView
extension JHWbMessageViewController {
    override func setupSubView() {
        super.setupSubView()
        visitorView.setupMessageController()
    }
    
    override func setupNavigationBar() {
        navigationItem.title = "消息"
    }
}
