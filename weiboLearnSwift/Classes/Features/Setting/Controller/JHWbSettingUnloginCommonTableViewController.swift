//
//  JHWbSettingUnloginCommonTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/14.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingUnloginCommonTableViewController: JHWbSettingBaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "通用设置", leftBtnTitle: "返回")
        setupSubview()
    }
}

// MARK: - stupUI
extension JHWbSettingUnloginCommonTableViewController {
    private func setupSubview() {
        setupGrup0()
        setupGrup1()
        setupGrup2()
    }
    
    private func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingSwitchItemModel.init(title: "声音")
        item11.switchOn = true
        items.add(item11)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    private func setupGrup1() {
        let items = NSMutableArray()
        let item21 = JHWbSettingArrowItemModel.init(title: "多语言环境", detailTextLabel: "跟随系统")
        item21.desVC = NSStringFromClass(JHWbSettingUnloginLanguageTableViewController.classForCoder())
        
        items.add(item21)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    private func setupGrup2() {
        let items = NSMutableArray()
        let item31 = JHWbSettingArrowItemModel.init(title: "视频和动图自动播放", detailTextLabel: "仅WIFI")
        item31.desVC = NSStringFromClass(JHWbSettingUnloginNetWorkTableViewController.classForCoder())
        items.add(item31)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}
