//
//  JHWbSettingUnloginNetWorkTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/17.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SVProgressHUD

//闭包类型
typealias sentNetWorkTitleClosure = (_ title: String)->Void

class JHWbSettingUnloginNetWorkTableViewController: JHWbSettingBaseTableViewController {
    //声明一个闭包
    var netWorkTitleClosure : sentNetWorkTitleClosure?
    
    private var selctCell : UITableViewCell!
    private var defalutSelectDetialText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "视频和动画自动播放")
        setupSubview()
    }
}


// MARK: - stupUI
extension JHWbSettingUnloginNetWorkTableViewController {
    private func setupSubview() {
        setupGrup0()
    }
    
    private func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingCheckItemModel.init(title: "使用移动流量和WiFi")
        items.add(item11)
        
        let item12 = JHWbSettingCheckItemModel.init(title: "仅WiFi")
        items.add(item12)
        
        let item13 = JHWbSettingCheckItemModel.init(title: "关闭")
        items.add(item13)
        
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}
extension JHWbSettingUnloginNetWorkTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selctCell?.accessoryType = .none
        selctCell?.accessoryView = nil
        selctCell = tableView.cellForRow(at: indexPath)
        selctCell?.accessoryType = .checkmark
        SVProgressHUD.show(withStatus: "设置中...")
        SVProgressHUD.dismiss(withDelay: 1)
        
        //Closure 传值
        if netWorkTitleClosure != nil {
            let title = selctCell?.textLabel?.text
            self.netWorkTitleClosure!(title!)
        }
    }
}

