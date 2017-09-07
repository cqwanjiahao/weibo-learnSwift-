//
//  JHWbMessageTableTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMessageTableTableViewController: JHWbBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
}

// MARK:- setupView
extension JHWbMessageTableTableViewController {
    override func setupSubView() {
        super.setupSubView()
        visitorView.setupMessageController()
    }
    
    override func setupNavigationBar() {
        navigationItem.title = "消息"
    }
}

// MARK: - Table view data source
extension JHWbMessageTableTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
