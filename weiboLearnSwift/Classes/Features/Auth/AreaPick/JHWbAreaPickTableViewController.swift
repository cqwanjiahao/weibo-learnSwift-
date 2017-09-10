//
//  JHWbAreaPickTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickTableViewController: UITableViewController {
//    //cell子控件
//    let AreaInfo : (_ string: String) -> (String)
//    AreaInfo = {
//    (_ string: String) -> (String) in
//    return "6" + string
//    }
    
    //模型属性
    lazy var areaModelArray : [JHWbAreaPickModel] = {
            let areaPlistArray = NSArray.init(contentsOfFile: Bundle.main.path(forResource: "areaPick", ofType: ".plist")!)!
            let dicArray = NSMutableArray.init()
            
            for dic in areaPlistArray {
                dicArray.add(JHWbAreaPickModel.init(dict: dic as! [String : AnyObject]))
            }
        return dicArray as! [JHWbAreaPickModel]
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
}

// MARK: - 数据源方法
extension JHWbAreaPickTableViewController {
    ///cell
    override func numberOfSections(in tableView: UITableView) -> Int {
        return areaModelArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (areaModelArray[section].areas?.count)!
}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AreaPickCell", for: indexPath) as! JHWbAreaPickTableViewCell
        let areaInfoArray = areaModelArray[indexPath.section].areas
        cell.viewModel = (areaInfoArray![indexPath.row] as! JHWbAreaInfoModel)
        return cell
    }
    
    ///headView
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return areaModelArray[section].titleName
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

}
// MARK: - 代理方法
extension JHWbAreaPickTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //dissmiss   然后block传值
        navigationController?.popViewController(animated: true)
//        navigationController?.dismiss(animated: true, completion: {
            //传入block
//            areaInfo("666")->("777")
//            func areaInfoBlock() -> String {
////                let areaInfoArray = self.areaModelArray[indexPath.section].areas
////                return (areaInfoArray![indexPath.row] as! JHWbAreaInfoModel).areaInfo
//                return "6666"
//            }
//        })
        jh_log(messsage: indexPath.row)
    }
}
