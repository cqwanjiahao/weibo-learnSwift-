//
//  JHWbSettingUnloginAboutWBTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/16.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingUnloginAboutWBTableViewController: JHWbSettingBaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "关于微博", leftBtnTitle: "返回")
        setupSubview()
    }
}

// MARK: - stupUI
extension JHWbSettingUnloginAboutWBTableViewController {
    func setupSubview() {
        setupGrup0()
        tableView.isScrollEnabled = false
    }
    
    func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingArrowItemModel.init(title: "官方微博")
        items.add(item11)
        
        let item12 = JHWbSettingArrowItemModel.init(title: "去评分")
        items.add(item12)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}


// MARK: - dataSource
extension JHWbSettingUnloginAboutWBTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vi11 = UIView.init(lineViewColor: .red)
        vi11.frame = .init(x: 0, y: 0, width: 300, height: 200)
        return vi11
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let vi11 = UIView.init(lineViewColor: .yellow)
        vi11.frame = .init(x: 0, y: 0, width: 300, height: 200)
        return vi11
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 201
    }
}
