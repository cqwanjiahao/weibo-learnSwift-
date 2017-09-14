//
//  JHWbAreaPickTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
//闭包类型
typealias SendAreaInfoClosure = (_ Title: String)->Void

class JHWbAreaPickTableViewController: UITableViewController {
//    //闭包属性
//    var areaInfoTitle : String!
    //声明一个闭包
    var areaInfoClosure : SendAreaInfoClosure?
  
//    func setAreaInfoLable(title: String, respont: AreaInfoCloser) {
//        self.areaInfoRespont = respont
//        self.AreaInfoTitle = title
//    }
    
    
    private var didSetupConstraints = false
    var indexes=[String]()
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
        setupSubview()
//        registerCell()
        view.updateConstraintsIfNeeded()
        view.setNeedsUpdateConstraints()
    }
}

extension JHWbAreaPickTableViewController {
    func setupSubview() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.sectionIndexColor = UIColor.jh_setColor(r: 122, g: 130, b: 140)
        tableView.sectionIndexBackgroundColor = UIColor.clear
        tableView.sectionIndexTrackingBackgroundColor = UIColor.jh_setColor(r: 191, g: 195, b: 199)
        tableView.showsVerticalScrollIndicator = false
        automaticallyAdjustsScrollViewInsets = true
    }
    //经测试 可以删除
    //    func registerCell() {
    //        tableView.register(JHWbAreaPickTableViewCell.self, forCellReuseIdentifier: JHWbAreaPickTableViewCell.cellIdentifier())
    //    }
}

// MARK: - constranits
extension JHWbAreaPickTableViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
        }
        super .updateViewConstraints()
    }
}

// MARK: - 数据源方法
extension JHWbAreaPickTableViewController {
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
    
    ///headView  自定义View
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return JHWbAreaPickTableHeaderView.init(title: areaModelArray[section].titleName!)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 21
    }
}

// MARK: - 代理方法
extension JHWbAreaPickTableViewController {
    ///点击cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Closure 传值
        if areaInfoClosure != nil {
          let title1 = (areaModelArray[indexPath.section].areas![indexPath.row] as! JHWbAreaInfoModel).country
          let title2 = (areaModelArray[indexPath.section].areas![indexPath.row] as! JHWbAreaInfoModel).addressNum
            let title = title1! + " +" + title2!
            areaInfoClosure!(title)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    /// 设置索引条
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        for i in 0..<areaModelArray.count {
            var ch = areaModelArray[i].titleName
            if ch == "常用" {
                ch = "+"
            }
            indexes.append(ch!)
        }
        return indexes
    }
    
    //点击索引响应方法
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        for i in indexes {
            if i == title {
                return index
            }
        }
        return  0;
    }
}
