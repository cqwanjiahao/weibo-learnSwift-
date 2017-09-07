//
//  JHWbMeTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMeTableViewController: JHWbBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        setupSubView()
    }
}

// MARK:- setupView
extension JHWbMeTableViewController {
    override func setupSubView() {
        super.setupSubView()
        visitorView.setupMeController()
    }
    
    override func setupNavigationBar() {
        navigationItem.title = "我"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style:.plain, target: self, action: #selector(JHWbMeTableViewController.settingButtonClick))
    }
}

//MARK: - Click
extension JHWbMeTableViewController {
    @objc func settingButtonClick() {
        jh_log(messsage: "点击了监听按钮")
    }
}

// MARK: - Table view data source
extension JHWbMeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
