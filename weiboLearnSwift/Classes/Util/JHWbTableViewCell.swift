//
//  JHWbTableViewCell.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/10.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbTableViewCell: UITableViewCell {
    var didSetupConstraints = false

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
    }

    func setupViews() {
        // sub class implement
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        contentView .setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    func configureCellDate(entity: Any) {
        updateConstraintsIfNeeded()
        setNeedsUpdateConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
