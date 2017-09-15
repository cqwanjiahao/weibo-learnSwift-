//
//  JHWbSettingBaseTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/13.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingBaseTableViewController: UITableViewController {
    var groups : NSMutableArray = NSMutableArray()
    
    public init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.jh_setColor(rgb: 240)
        tableView.separatorStyle = .none
    }
}


// MARK: - DataSource
extension JHWbSettingBaseTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group : JHWbSettingGroupModel = groups[section] as! JHWbSettingGroupModel
        return group.items!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = JHWbSettingTableViewCell.dequeueOrCreateCell(tableView: tableView)
        cell.configureCellDate(entity: (groups[indexPath.section] as! JHWbSettingGroupModel).items![indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let item : JHWbSettingItemModel = (groups[indexPath.section] as! JHWbSettingGroupModel).items![indexPath.row] as! JHWbSettingItemModel
        if item.isKind(of: type(of: JHWbSettingArrowItemModel())) {
            if ((item as! JHWbSettingArrowItemModel).desVC != nil) {
                let desVC = desViewController(desVCName: (item as! JHWbSettingArrowItemModel).desVC!, desVCTitle: item.title!)
                
                navigationController?.pushViewController(desVC, animated: true)
            }
        } else if item.isKind(of: type(of: JHWbSettingSwitchItemModel())) {
            (item as! JHWbSettingSwitchItemModel).switchOn = !(item as! JHWbSettingSwitchItemModel).switchOn
        }
        //闭包完成其他事件功能
        if item.operationClosure != nil {
            item.operationClosure!(indexPath)
        }
    }
    
//    //MARK:- 根据名字 创建控制器
    func desViewController(desVCName: String,desVCTitle: String) -> UIViewController {
        //获取命名空间
//        jh_log(messsage: desVCName)
//        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//        jh_log(messsage: nameSpace)
        guard let desVCClass = NSClassFromString(desVCName) else  {
            print("没有获取到字符串对应的Class")
            return UIViewController()
        }
        //将对应的AnyObject转成控制器的类型
        let desVCType = desVCClass as? UIViewController.Type
        //创建对应的控制器对象
        let desVC = desVCType!.init()
        desVC.title = desVCTitle
        return desVC
    }
}

//MARK:- StupNav
extension JHWbSettingBaseTableViewController {
    func setupNav(title: String,leftBtnTitle: String = "返回") {
        self.title = title
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        setupLeftBarButton(title: title)
    }
    
    func setupLeftBarButton(title: String) {
        let leftBtn = UIButton()
        view.addSubview(leftBtn)
        leftBtn.setTitle(title, for: .normal)
        leftBtn.setTitleColor(.black, for: .normal)
        leftBtn.setTitleColor(UIColor.jh_setColor(r: 255, g: 130, b: 0), for: .highlighted)
        leftBtn.setImage(#imageLiteral(resourceName: "nav_backBtn"), for: .normal)
        leftBtn.setImage(#imageLiteral(resourceName: "nav_backBtn_highlighted"), for: .highlighted)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        leftBtn.sizeToFit()
        leftBtn.addTarget(self, action:  #selector(JHWbSettingBaseTableViewController.leftBackBtnClick), for: .touchUpInside)
        leftBtn.imageView?.snp.makeConstraints { (make) -> Void in
            make.leading.centerY.equalToSuperview()
            make.size.equalTo(jh_getsize(x: 15, y: 20))
        }
        let lefrBarBtn = UIBarButtonItem.init(customView: leftBtn)
        
        let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        leftNegativeSpacer.width = -10
        navigationItem.leftBarButtonItems = [leftNegativeSpacer, lefrBarBtn]
    }
}

// MARK: - Events
extension JHWbSettingBaseTableViewController {
    @objc func leftBackBtnClick() {
        navigationController?.popViewController(animated: false)
    }
}
