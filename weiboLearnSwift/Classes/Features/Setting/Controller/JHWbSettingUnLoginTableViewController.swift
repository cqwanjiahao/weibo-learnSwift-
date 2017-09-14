//
//  JHWbSettingUnLoginTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/12.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
class JHWbSettingUnLoginTableViewController: JHWbSettingBaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "设置", leftBtnTitle: "我")    //setupLeftBarButton(title: "设置")
        setupSubview()
    }
}

// MARK: - stupUI
extension JHWbSettingUnLoginTableViewController {
    func setupSubview() {
        view.backgroundColor = UIColor.jh_setColor(rgb: 240)
        setupGrup0()
        setupGrup1()
    }
    
    func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingArrowItemModel.init(title: "通用设置")
        item11.desVC = type(of: UIViewController()) as AnyClass
        items.add(item11)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    func setupGrup1() {
        let items = NSMutableArray()
        let item21 = JHWbSettingArrowItemModel.init(title: "客服中心")
        item21.desVC = type(of: UIViewController()) as AnyClass
        items.add(item21)
        let item22 = JHWbSettingArrowItemModel.init(title: "关于微博")
        item22.desVC = type(of: UIViewController()) as AnyClass
        items.add(item22)
        let item3333333333333 = JHWbSettingSwitchItemModel.init(title: "关于微博")
        item3333333333333.switchOn = true
        items.add(item3333333333333)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}






//// MARK: - Table view data source
//extension JHWbSettingUnLoginTableViewController {
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        jh_log(messsage: cellModelArray.count)
//        return cellModelArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        jh_log(messsage: cellModelArray[section].count)
//        return cellModelArray[section].count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = JHWbSettingTableViewCell.dequeueOrCreateCell(tableView: tableView)
//        cell.textLabel?.text = cellModelArray[indexPath.section][indexPath.row]
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 15
//    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView.init(lineViewColor: UIColor.clear)
//    }
//}
//

