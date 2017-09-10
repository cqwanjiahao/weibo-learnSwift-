//
//  JHWbAreaPickTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickTableViewController: UITableViewController {
    var didSetupConstraints = false
//    override init(style: UITableViewStyle) {
//        style = UITableViewStylePlain;
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
    
    
    lazy var footerView = UIView.init(lineViewColor: .red)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        registerCell()
        view.updateConstraintsIfNeeded()
        view.setNeedsUpdateConstraints()
        navigationController?.navigationBar.tintColor = UIColor.darkGray
    }
}

extension JHWbAreaPickTableViewController {
    func setupSubview() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.tableFooterView = footerView
        automaticallyAdjustsScrollViewInsets = true
    }
    
    func registerCell() {
        //可能可以省略  最后试一试  最后!!
        tableView.register(JHWbAreaPickTableViewCell.self, forCellReuseIdentifier: JHWbAreaPickTableViewCell.cellIdentifier())
    }
}

// MARK: - constranits
extension JHWbAreaPickTableViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            tableView.tableHeaderView?.snp.makeConstraints({ (make) -> Void in
                make.height.equalTo(54)
                make.top.equalTo(UIScreen.main.bounds.size.height - 118)
                make.leading.width.equalToSuperview()
            })
            
            footerView.snp.makeConstraints({ (make) -> Void in
                make.height.equalTo(54)
                make.top.equalTo(UIScreen.main.bounds.size.height - 118)
                make.leading.width.equalToSuperview()
            })
        }
        super .updateViewConstraints()
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
        let cell = JHWbAreaPickTableViewCell.dequeueOrCreateCell(tableView: tableView)
        cell.configureCellDate(entity: (areaModelArray[indexPath.section].areas![indexPath.row] as! JHWbAreaInfoModel))
        return cell
    }
    
    ///headView  自定义View  高度15
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return JHWbAreaPickTableHeaderView.init(title: areaModelArray[section].titleName!)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 21
    }

    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
    
//    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
//        if (section == areaModelArray.count - 1) {
//            tableView.tableFooterView = footerView
////            footerView.snp.makeConstraints({ (make) -> Void in
////                //                make.size.equalToSuperview()
////                //                make.center.equalToSuperview()
////                make.height.equalTo(54)
////                make.top.equalTo(UIScreen.main.bounds.size.height - 118)
////                make.leading.width.equalToSuperview()
////            })
////            footerView.layoutIfNeeded()
//        } else {
//            tableView.tableFooterView = nil
//        }
//    }
    
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
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView == tableView {
//            let tableView1 = UIScrollView()
//            let footerHeight = 54.0
//            let offsetY = tableView1.contentOffset.y
//            switch offsetY {
//            case 0..<footerHeight : tableView1.contentInset = UIEdgeInsetsMake(-offsetY, 0, CGFloat(-footerHeight), 0)
//            case footerHeight..<tableView1.contentSize.height - tableView1.frame.size.height - footerHeight : tableView1.contentInset = UIEdgeInsetsMake(0, 0, CGFloat(-footerHeight), 0)
//            case >tableView1.contentSize.height - tableView1.frame.size.height :
//                tableView1.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(tableView1.contentSize.height - tableView1.frame.size.height - footerHeight), 0)
//            }
//
//        }
    }
}