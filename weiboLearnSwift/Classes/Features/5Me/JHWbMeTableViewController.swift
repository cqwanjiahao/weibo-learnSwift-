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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        jh_log(messsage: visitorView.frame)
//        hidesBottomBarWhenPushed = true
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        hidesBottomBarWhenPushed = false
//        tabBarController.
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK:- setupView
extension JHWbMeTableViewController {
    override func setupSubView() {
        super.setupSubView()
//        hidesBottomBarWhenPushed = true
        visitorView.setupMeController()
    }
    
    override func setupNavigationBar() {
        navigationItem.title = "我"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style:.plain, target: self, action: #selector(JHWbMeTableViewController.settingBtnClick))
    }
    
    
}


//MARK: - Click
extension JHWbMeTableViewController {
    
    @objc private func settingBtnClick(){ navigationController?.pushViewController(JHWbSettingUnLoginTableViewController(), animated: false)
//    @objc private func settingBtnClick(){ navigationController?.pushViewController(JHWbSettingUnLoginTableViewController(), animated: false)
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

