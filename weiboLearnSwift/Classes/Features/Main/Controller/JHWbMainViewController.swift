//
//  JHWbMainViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

///warning :tabBarItem 颜色有问题
import UIKit

class JHWbMainViewController: UITabBarController {
    /// MARK: - lazyLoad
    lazy var composeButton = UIButton()
    lazy var isLogin = false
    var didSetupConstraints = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildVc()
        setupSubView()
        
        UINavigationBar.appearance().tintColor = UIColor.orange
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: .selected)
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
    }
    

}

// MARK:- setupChildVC
extension JHWbMainViewController {
    //Json加载控制器
    private func setupChildVc() {
        let jsonData = NSData.init(contentsOfFile: Bundle.main.path(forResource: "MainVCSettings.json", ofType:nil)!)
        do {
            let jsonArray: [[String: String]] = (try JSONSerialization.jsonObject(with:jsonData! as Data, options:.mutableContainers) as? [[String: String]])!
            for dict in jsonArray {
                let vcName = dict["vcName"]
                let title = dict["title"]
                let imageName = dict["imageName"]
                addChildViewController(childVcName: vcName!, title: title!, imageName: imageName!)
            }
        } catch {
            print(error)
        }
    }
    
    //添加子控制器
    private func addChildViewController(childVcName: String, title : String, imageName : String) {
        //获取命名空间
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        guard let childVcClass = NSClassFromString(nameSpace + "." + childVcName) else  {
            print("没有获取到字符串对应的Class")
            return
        }
        //将对应的AnyObject转成控制器的类型
        let childVcType = childVcClass as? UIViewController.Type
        //创建对应的控制器对象
        let childVc = childVcType!.init()
        //设置子控制器属性
        childVc.title = title

        childVc.tabBarItem.image = UIImage.init(named: imageName)
    
        childVc.tabBarItem.selectedImage = UIImage.init(named: imageName + "_highlighted")
        
        //包装导航控制器
        let childNav = UINavigationController.init(rootViewController: childVc)
        //添加控制器
        addChildViewController(childNav)
    }
}

// MARK:- setupView
extension JHWbMainViewController {
    //设置subView
    func setupSubView() {
        setupComposeButton()
    }
    //添加发布按钮
    func setupComposeButton() {
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        composeButton.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .selected)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .selected)
        composeButton .sizeToFit()
        view .addSubview(composeButton)
        composeButton .addTarget(self, action: #selector(JHWbMainViewController.composeButtonClick), for: .touchUpInside)
        
        composeButton.center = tabBar.center
    }
}

// MARK:- 事件监听
extension JHWbMainViewController {
    @objc fileprivate func composeButtonClick() -> Void {
        print("点击了发布按钮")
        
    }
}

// MARK:- 设置约束
extension JHWbMainViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            //设置约束
        }
        super .updateViewConstraints()
    }
}
