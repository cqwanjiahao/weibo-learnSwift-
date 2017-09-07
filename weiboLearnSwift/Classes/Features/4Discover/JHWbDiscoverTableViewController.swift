//
//  JHWbDiscoverTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbDiscoverTableViewController: JHWbBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
    
}

// MARK:- setupView
extension JHWbDiscoverTableViewController {
    override func setupSubView() {
        super.setupSubView()
    }
    
    override func setupNavigationBar() {
        navigationItem.title = "发现"
    }
}

// MARK: - Table view data source
extension JHWbDiscoverTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
