//
//  JHWbSettingTableViewCell.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/12.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbSettingTableViewCell: JHWbTableViewCell {
    var itemModel : JHWbSettingItemModel?
    
    // MARK:- 注册Cell
    class func dequeueOrCreateCell(tableView: UITableView) -> JHWbSettingTableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: JHWbSettingTableViewCell.cellIdentifier())
        if (cell == nil) {
            cell = JHWbSettingTableViewCell.init(style: .default, reuseIdentifier: JHWbSettingTableViewCell.cellIdentifier())
//            cell?.selectionStyle = .none
        }
        return cell as! JHWbSettingTableViewCell
        
    }
    class func cellIdentifier() -> String {
        return "JHWbSettingTableViewCell";
    }
    
    override func setupViews() {
        super.setupViews()
        textLabel?.backgroundColor = UIColor.clear
    }
    
    override func configureCellDate(entity: Any) {
        itemModel = entity as? JHWbSettingItemModel
        textLabel?.text = itemModel?.title
        setupRightView()
        super.configureCellDate(entity: entity)
    }
}

extension JHWbSettingTableViewCell {
    func setupRightView() {
        if (itemModel?.isKind(of: type(of: JHWbSettingArrowItemModel()) as AnyClass))! {
//            accessoryView = UIImageView.init(image: #imageLiteral(resourceName: "setting_arrow_right"))
            accessoryType = .disclosureIndicator
        } else if (itemModel?.isKind(of: type(of: JHWbSettingSwitchItemModel()) as AnyClass))!{
            let switchBtn = UISwitch()
           switchBtn.isOn = (itemModel as! JHWbSettingSwitchItemModel).switchOn
            accessoryView = switchBtn
        } else {
            accessoryView = nil
        }
    }
}

//MARK- 拓展:当需要高亮状态下改变文字颜色的时候 调用以下方法
/*
 
     //设置选中状态下的颜色
     override func setHighlighted(_ highlighted: Bool, animated: Bool) {
         super.setHighlighted(highlighted, animated: animated)
         if highlighted {
             contentView.backgroundColor = UIColor.jh_setColor(rgb: 238)
             accessoryView?.backgroundColor = UIColor.jh_setColor(rgb: 238)
         } else {
             contentView.backgroundColor = UIColor.jh_setColor(rgb: 255)
             accessoryView?.backgroundColor = UIColor.jh_setColor(rgb: 255)
         }
         jh_log(messsage: accessoryView?.backgroundColor)
         imageView?.backgroundColor = contentView.backgroundColor?
     }
 */
