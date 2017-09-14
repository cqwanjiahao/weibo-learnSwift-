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
//        setupLeftBarButton(title: "设置")
        setupSubview()
    }
}

// MARK: - stupUI
extension JHWbSettingUnLoginTableViewController {
    func setupSubview() {
        setupGrup0()
        setupGrup1()
    }
    
    func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingArrowItemModel.init(title: "通用设置")
        item11.desVC = JHWbSettingUnloginCommonTableViewController()
        items.add(item11)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    func setupGrup1() {
        let items = NSMutableArray()
        let item21 = JHWbSettingArrowItemModel.init(title: "客服中心")
        item21.desVC = JHWbWebViewController.init(webAdress: "http://kefu.weibo.com/",title: "客服中心",backgroudColor: UIColor.jh_setColor(rgb: 170), backgroundTitle: "网页由 kefu.weibo.com 提供")
        navigationController?.pushViewController(item21.desVC!, animated: true)
        items.add(item21)
        let item22 = JHWbSettingArrowItemModel.init(title: "关于微博")
//        item22.desVC = type(of: UIViewController()) as AnyClass
        items.add(item22)
        let item3333333333333 = JHWbSettingArrowItemModel.init(title: "test")
        
        item3333333333333.desVC = JHWbComposeViewController()
//        item3333333333333.operationClosure = receiveoperationClosure
        items.add(item3333333333333)
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
    
    //MARK:- 特殊需求的时候 使用闭包完成
    /*
    func receiveoperationClosure(indexPath: IndexPath)->Void{
        let cell = tableView.cellForRow(at: indexPath)
        let textFeild = UITextField()
        cell?.addSubview(textFeild)
        textFeild.becomeFirstResponder()
    }
    */
}
