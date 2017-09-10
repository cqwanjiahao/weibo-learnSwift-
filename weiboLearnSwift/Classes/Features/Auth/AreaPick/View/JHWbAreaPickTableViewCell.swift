//
//  JHWbAreaPickTableViewCell.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbAreaPickTableViewCell: JHWbTableViewCell {
    // MARK:- 注册Cell
    class func dequeueOrCreateCell(tableView: UITableView) -> JHWbAreaPickTableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: JHWbAreaPickTableViewCell.cellIdentifier()) 
        if (cell == nil) {
            cell = JHWbAreaPickTableViewCell.init(style: .default, reuseIdentifier: JHWbAreaPickTableViewCell.cellIdentifier())
            cell?.selectionStyle = .none
        }
        return cell as! JHWbAreaPickTableViewCell
        
    }
    class func cellIdentifier() -> String {
        return "CCCourseHistoryTableViewCommentCell";
    }

    // MARK:- 控件属性
    lazy var countryLabel = { () -> UILabel in
        let countryLabel = UILabel()
        countryLabel.textColor = UIColor.jh_setColor(rgb: 0)
        countryLabel.textAlignment = .left
        countryLabel.font = .systemFont(ofSize: jh_getLength(length: 17))
        return countryLabel
    }()
    lazy var adressNumLabel = { () -> UILabel in
        let adressNumLabel = UILabel()
        adressNumLabel.textColor = UIColor.jh_setColor(r: 2, g: 107, b: 173)
        adressNumLabel.textAlignment = .right
        adressNumLabel.font = .systemFont(ofSize: jh_getLength(length: 15))
        return adressNumLabel
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .clear
        contentView.addSubview(countryLabel)
        contentView.addSubview(adressNumLabel)
    }
    
    //MARK:- 配置文件
    override func configureCellDate(entity: Any) {
        countryLabel.text = (entity as! JHWbAreaInfoModel).country
        adressNumLabel.text = (entity as! JHWbAreaInfoModel).addressNum
        super.configureCellDate(entity: entity)
    }
}

extension JHWbAreaPickTableViewCell {
    
    override func updateConstraints() {
        if !didSetupConstraints {
        didSetupConstraints = true
            countryLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 13))
                make.left.equalToSuperview().offset(jh_getLength(length: 16))
                make.size.equalTo(jh_getsize(x: 200, y: 18))
            })
            adressNumLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalToSuperview().offset(jh_getLength(length: 14))
//                make.centerY.equalTo(countryLabel)
                make.leading.equalToSuperview().offset(UIScreen.main.bounds.width - 130)
                make.size.equalTo(jh_getsize(x: 100, y: 15))
            })
        }
        super.updateConstraints()
    }
}

extension JHWbAreaPickTableViewCell {

}
