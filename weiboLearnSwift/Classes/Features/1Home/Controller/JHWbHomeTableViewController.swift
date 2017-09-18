//
//  JHWbHomeTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
class JHWbHomeTableViewController: JHWbBaseTableViewController {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
    private lazy var navTitleView = JHWbHomeTitleView()
    private var selectTitleBtn : JHWbHomeTitleBtn? = nil
    private lazy var popoverAnimator = JHWbPopoverAnimator()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSubView()
            setupNavTitleViewEvents()
        }
}

// MARK:- UI
extension JHWbHomeTableViewController {
     override func setupSubView() {
        super.setupSubView()
        visitorView.setupHomeController()
        setupNavigationBar()
    }
    
    /// 设置导航条
    override  func setupNavigationBar() {
        ///设置标题按钮
        navigationItem.title = ""
        navigationController?.navigationBar.addSubview(navTitleView)
        if isLogin {
            let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            leftNegativeSpacer.width = -10
            let leftButton = UIBarButtonItem.init(imageName: "navigationbar_camera")
            navigationItem.leftBarButtonItems = [leftNegativeSpacer, leftButton]
            
            let rightNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            rightNegativeSpacer.width = -10
            let rightButton = UIBarButtonItem.init(imageName: "navigationbar_pop")
            navigationItem.rightBarButtonItems = [rightNegativeSpacer, rightButton]
        } else{
        super .setupNavigationBar()
        }
    }
}

// MARK:- Evens
extension JHWbHomeTableViewController {
    private func setupNavTitleViewEvents() {
        navTitleView.attentionBtn.addTarget(self, action: #selector(JHWbHomeTableViewController.attentionBtnClick), for: .touchUpInside)
        navTitleView.hotTopicBtn.addTarget(self, action: #selector(JHWbHomeTableViewController.hotTopicBtnClick), for: .touchUpInside)
    }
    
    @objc func attentionBtnClick() {
        
        if selectTitleBtn == navTitleView.attentionBtn {
            navTitleView.attentionBtn.isSelected = !navTitleView.attentionBtn.isSelected
        } else {
            selectTitleBtn?.isSelected = false
            selectTitleBtn = navTitleView.attentionBtn
            selectTitleBtn?.isSelected = true
        }
    }
    @objc func hotTopicBtnClick() {
        if selectTitleBtn == navTitleView.hotTopicBtn {
            navTitleView.hotTopicBtn.isSelected = !navTitleView.hotTopicBtn.isSelected
        } else {
            selectTitleBtn?.isSelected = false
            selectTitleBtn = navTitleView.hotTopicBtn
            selectTitleBtn?.isSelected = true
        }
        
        let hotTopicPopVC = JHWbHomeHotTopicPopoverCollectionViewController()
        hotTopicPopVC.modalPresentationStyle = .custom
        hotTopicPopVC.transitioningDelegate = popoverAnimator

        present(hotTopicPopVC, animated: true, completion: nil)
        
        
        //        if button.isSelected {
        //            button.bottomLine.isHidden = false
        //        } else {
        //            button.bottomLine.isHidden = true
        //        }
    }
}

//MARK: - Constraint
extension JHWbHomeTableViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            navTitleView.snp.makeConstraints({ (make) -> Void in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 120, height: 43))
            })
        }
        super.updateViewConstraints()
    }
}

// MARK: - Table view data source
extension JHWbHomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
