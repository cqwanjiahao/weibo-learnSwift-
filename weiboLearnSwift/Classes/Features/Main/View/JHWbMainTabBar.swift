//
//  JHWbMainTabBar.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/14.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
protocol JHWbMainTabBarDelegate :NSObjectProtocol {
    //代理方法
    func barBtnAction(_ sender: JHWbTabBarAddBtn)
}

class JHWbMainTabBar: UITabBar {
    var mainTabBarDelegate : JHWbMainTabBarDelegate?
    let addBarBtn : JHWbTabBarAddBtn = JHWbTabBarAddBtn.init(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addBarBtn)
        addBarBtn.addTarget(self, action: #selector(JHWbMainTabBar.barBtnAction(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //记录item个数
        let itemCount : CGFloat = CGFloat((self.items!.count))
        let itemW = self.bounds.size.width / (itemCount + 1)
        let itemH : CGFloat = self.bounds.size.height
        var itemCurrent = 0
        //遍历子视图,找出tabbarButton依次分配位置
        for subView in self.subviews {
            if NSStringFromClass(subView.classForCoder) == "UITabBarButton" {
                if itemCurrent == 2 {
                    itemCurrent = 3
                }
                let itemX : CGFloat = CGFloat(itemCurrent) * itemW
                subView.frame = CGRect.init(x: itemX, y: 0.0, width: itemW, height: itemH)
                itemCurrent += 1
            }
            //计算加号的位置
            self.addBarBtn.bounds.size = CGSize.init(width: itemW, height: itemH)
            self.addBarBtn.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JHWbMainTabBar {
    @objc  func barBtnAction(_ sender: JHWbTabBarAddBtn) {
        if mainTabBarDelegate != nil {
            mainTabBarDelegate?.barBtnAction(sender)
        }
    }
    
}

//MARK - 当addBtn超出tabbar范围   使用hittest 添加事件处理
///这个方法是为了让超出的加号部分也能点击响应
/*
override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    if self.isHidden == false {
        let newPoint: CGPoint = self.convert(point, to: self.addBarBtn)
        //判断点击的点在加号的范围里面,那么响应的范围就是加号的范围
        if self.addBarBtn.point(inside: newPoint, with: event) {
            return self.addBarBtn
        } else {
            //其他的时候 按照系统原来的方法运行
            return super.hitTest(point, with: event)
        }
    } else {
        return super.hitTest(point, with: event)
    }
}
*/
