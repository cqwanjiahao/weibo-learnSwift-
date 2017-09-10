//
//  JHWbAreaPickTableViewCell.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/1.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAreaPickTableViewCell: UITableViewCell {
    // MARK:- 控件属性
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var adressNum: UILabel!
    
    // MARK:- 自定义属性
    var viewModel : JHWbAreaInfoModel? {
        didSet {
            guard viewModel != nil else {
                return
            }
            countryLabel.text = viewModel?.country
            adressNum.text = viewModel?.addressNum
        }
    }
}
