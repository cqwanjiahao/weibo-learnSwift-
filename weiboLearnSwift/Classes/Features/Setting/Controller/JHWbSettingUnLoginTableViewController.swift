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
        setupNav(title: "设置", leftBtnTitle: "我")
        setupSubview()
    }
}

// MARK: - stupUI
extension JHWbSettingUnLoginTableViewController {
    private func setupSubview() {
        setupGrup0()
        setupGrup1()
    }
    
    private func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingArrowItemModel.init(title: "通用设置")
        item11.desVC = NSStringFromClass(JHWbSettingUnloginCommonTableViewController.classForCoder())
        jh_log(messsage: item11.desVC)
        items.add(item11)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    private func setupGrup1() {
        let items = NSMutableArray()
        let item21 = JHWbSettingArrowItemModel.init(title: "客服中心")
        item21.desVC = NSStringFromClass(JHWbWebServiceCenterViewController.classForCoder())
        items.add(item21)
        
        let item22 = JHWbSettingArrowItemModel.init(title: "关于微博")
        item22.desVC = NSStringFromClass(JHWbSettingUnloginAboutWBTableViewController.classForCoder())
        items.add(item22)
        
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}

class JHWbWebServiceCenterViewController: JHWbWebViewController {
    init() {
        super.init(webAdress: "http://kefu.weibo.com/",title: "客服中心",backgroudColor: UIColor.jh_setColor(rgb: 170), backgroundTitle: "网页由 kefu.weibo.com 提供")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/* 拓展
let item3333333333333 = JHWbSettingArrowItemModel.init(title: "test")
item3333333333333.desVC = NSStringFromClass(JHWbComposeViewController.classForCoder())
//MARK:- 特殊需求的时候 使用闭包完成
//        item3333333333333.operationClosure = receiveoperationClosure
items.add(item3333333333333)

//MARK:- 特殊需求的时候 使用闭包完成
/*
 func receiveoperationClosure(indexPath: IndexPath)->Void{
 let cell = tableView.cellForRow(at: indexPath)
 let textFeild = UITextField()
 cell?.addSubview(textFeild)
 textFeild.becomeFirstResponder()
 }
 */
*/
