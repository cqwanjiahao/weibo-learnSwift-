//
//  JHWbSettingUnloginLanguageTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/16.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SVProgressHUD

//闭包类型
typealias sentLanguageTitleClosure = (_ title: String)->Void

class JHWbSettingUnloginLanguageTableViewController: JHWbSettingBaseTableViewController {
    //声明一个闭包
    var languageTitleClosure : sentLanguageTitleClosure?
    
    var selctCell : UITableViewCell!
    var defalutSelectDetialText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav(title: "多语言环境")
        setupSubview()
//        selctCell.isSelected = true
    }
}


// MARK: - stupUI
extension JHWbSettingUnloginLanguageTableViewController {
    func setupSubview() {
        setupGrup0()
    }
    
    func setupGrup0() {
        let items = NSMutableArray()
        let item11 = JHWbSettingCheckItemModel.init(title: "跟随手机系统")
        items.add(item11)
        
        let item12 = JHWbSettingCheckItemModel.init(title: "简体中文")
        items.add(item12)
        
        let item13 = JHWbSettingCheckItemModel.init(title: "繁体中文")
        items.add(item13)
        
        let item14 = JHWbSettingCheckItemModel.init(title: "English")
        items.add(item14)
        
        let group = JHWbSettingGroupModel.init(items: items)
        groups.add(group)
    }
}
extension JHWbSettingUnloginLanguageTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selctCell?.accessoryType = .none
        selctCell?.accessoryView = nil
        selctCell = tableView.cellForRow(at: indexPath)
        selctCell?.accessoryType = .checkmark
        SVProgressHUD.show(withStatus: "设置中...")
        SVProgressHUD.dismiss(withDelay: 1)
        
        //Closure 传值
        if languageTitleClosure != nil {
            let title = selctCell?.textLabel?.text
            self.languageTitleClosure!(title!)
        }
    }
}
