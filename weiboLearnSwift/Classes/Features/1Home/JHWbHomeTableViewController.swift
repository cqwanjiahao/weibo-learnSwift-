//
//  JHWbHomeTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
class JHWbHomeTableViewController: JHWbBaseTableViewController {
    lazy var titleButton = JHWbHomeTitleButton()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSubView()
        }
}

// MARK:- setupView
extension JHWbHomeTableViewController {
     override func setupSubView() {
        super.setupSubView()
        visitorView.setupHomeController()
        setupNavigationBar()
    }
    
    /// 设置导航条
    override  func setupNavigationBar() {
        super .setupNavigationBar()
        ///设置标题按钮
        titleButton.setTitle("wanjiahao", for: .normal)
        titleButton.addTarget(self, action: #selector(JHWbHomeTableViewController.titleButtonClick), for: .touchUpInside)
        navigationItem.titleView = titleButton
    }
}

// MARK:- Click
extension JHWbHomeTableViewController {
    @objc func titleButtonClick() -> Void {
        titleButton.isSelected = !titleButton.isSelected
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

