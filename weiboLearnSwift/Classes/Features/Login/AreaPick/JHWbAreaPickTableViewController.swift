//
//  JHWbAreaPickTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickTableViewController: UITableViewController {
    //模型属性
    lazy var areaModelArray : NSArray = JHWbAreaModel.areaPickPlist()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
}

// MARK: - Table view data source
extension JHWbAreaPickTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        jh_log(messsage: areaModelArray.count)
        return areaModelArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jh_log(messsage: (areaModelArray[section] as! NSArray).count)
//        areaModelArray[section].count
        return (areaModelArray[section] as! NSArray).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaPickCell", for: indexPath)
        return cell
    }
}
