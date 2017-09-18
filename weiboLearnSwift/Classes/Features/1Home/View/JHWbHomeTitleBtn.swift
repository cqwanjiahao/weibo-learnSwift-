//
//  JHWbHomeTitleBtn.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//
//顶部点击变化的titile   : 关注 / 热门
//自定义Btn  里面图标 使用transfrom 旋转动画
import UIKit
import SnapKit

class JHWbHomeTitleBtn: UIButton {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
//    lazy var bottomLine = UIView.init(lineViewColor: .red)

    public init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.jh_setColor(rgb: 137), for: .normal)
        setTitleColor(.black, for: .selected)
        setTitleColor(.black, for: .selected)
        setImage(#imageLiteral(resourceName: "navigationbar_arrow_down_new").rotateImage(ratation: .down), for: .normal)
        setImage(#imageLiteral(resourceName: "navigationbar_arrow_down_new"), for: .selected)

//        setImage( #imageLiteral(resourceName: "navigationbar_arrow_down_new").rotate(ratation: .left), for: .selected)
//        setImage(UIImage.init().jh_getRotateImage(image: #imageLiteral(resourceName: "navigationbar_arrow_down_new"), ratation: .left), for: .selected)
//        setImage(#imageLiteral(resourceName: "navigationbar_arrow_downdown"), for: .selected)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        sizeToFit()
        adjustsImageWhenHighlighted = false
//        addSubview(bottomLine)
//        bottomLine.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.jh_x = 0
        imageView?.jh_x = (titleLabel?.jh_width)! + 1
    }
}

////MARK: - Constraint
//extension JHWbHomeTitleBtn {
//    override func updateConstraints() {
//        if !didSetupConstraints {
//            didSetupConstraints = true
//            bottomLine.snp.makeConstraints({ (make) -> Void in
//                make.top.equalToSuperview().offset(37)
//                make.size.equalTo(CGSize.init(width: 24, height: 3))
//                make.leading.equalToSuperview().offset(6)
//            })
//        }
//        super.updateConstraints()
//    }
//}

