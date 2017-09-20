//
//  JHWbComposeTimeView.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/20.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import SnapKit

class JHWbComposeTimeView: UIView {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
    private lazy var dayLabel = { () -> UILabel in
        let dayLabel = UILabel()
        dayLabel.textColor = .jh_setColor(rgb: 70)
        dayLabel.font = .systemFont(ofSize: jh_getLength(length: 60))
        return dayLabel
    }()
    private lazy var weekLabel = { () -> UILabel in
        let weekLabel = UILabel()
        weekLabel.textColor = .jh_setColor(rgb: 70)
        weekLabel.font = .systemFont(ofSize: jh_getLength(length: 14))
        return weekLabel
    }()
    private lazy var yearLabel = { () -> UILabel in
        let yearLabel = UILabel()
        yearLabel.textColor = .jh_setColor(rgb: 70)
        yearLabel.font = .systemFont(ofSize: jh_getLength(length: 13))
        return yearLabel
    }()
    private lazy var weatherLable = { () -> UILabel in
    let weatherLable = UILabel()
    weatherLable.textColor = .jh_setColor(rgb: 70)
    weatherLable.font = .systemFont(ofSize: jh_getLength(length: 16))
        return weatherLable
    }()
    private lazy var  weatherGuideImageView = { () -> UIImageView in
        let weatherGuideImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: jh_getLength(length: 15), height: jh_getLength(length: 15)))
        var images = [UIImage]()
        for i in 1...23 {
            let imageName: String = "compose_weather_guide_anim_" + String(i)
            images.append(UIImage.init(named: imageName)!)
        }
        weatherGuideImageView.animationImages = images
        weatherGuideImageView.animationRepeatCount = 0
        weatherGuideImageView.animationDuration = 1
        weatherGuideImageView .startAnimating()
        weatherGuideImageView.backgroundColor = .red
        return weatherGuideImageView
    }()  //gif
    private lazy var advertImageView = UIImageView.init(image: #imageLiteral(resourceName: "tabbar_compose_advert"))
    
    //系统回调
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        configureSubViewDate()
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- setupView
extension JHWbComposeTimeView {
    private func setupSubView() {
        addSubview(dayLabel)
        addSubview(weekLabel)
        addSubview(yearLabel)
        addSubview(weatherLable)
        addSubview(weatherGuideImageView)
        addSubview(advertImageView)
        weatherGuideImageView .startAnimating()
    }
    
    //获取当前时间(系统方法)
    //当前地址  当前天气:(模型传递获取:)创建模型 然后先给一个假模型
    private func configureSubViewDate() {
        dayLabel.text = "21"
        weekLabel.text = "星期三"
        yearLabel.text = "09/2017"
        weatherLable.text = "重庆: 多云23°C"
    }
}

//MARK: - Constraint
extension JHWbComposeTimeView {
    override func updateConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            dayLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(jh_getLength(length: 15))
                make.leading.equalTo(jh_getLength(length: 20))
                make.size.equalTo(jh_getsize(x: 75, y: 42))
            })
            
            weekLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(dayLabel)
                make.leading.equalTo(dayLabel.snp.trailing).offset(jh_getLength(length: 1))
                make.size.equalTo(jh_getsize(x: 60, y: 15))
            })
            
            yearLabel.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(weekLabel.snp.bottom).offset(jh_getLength(length: 10))
                make.leading.equalTo(weekLabel)
                make.size.equalTo(jh_getsize(x: 60, y: 14))
            })
            
            weatherLable.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(dayLabel.snp.bottom).offset(jh_getLength(length: 20))
                make.leading.equalTo(dayLabel)
                make.height.equalTo(jh_getLength(length: 16))
            })
            
            weatherGuideImageView.snp.makeConstraints({ (make) -> Void in
                make.top.equalTo(weatherLable).offset(jh_getLength(length: 1))
                make.leading.equalTo(weatherLable.snp.trailing).offset(jh_getLength(length: 10))
                make.size.equalTo(jh_getsize(x: 15, y: 15))
            })
            
            advertImageView.snp.makeConstraints({ (make) -> Void in
                make.top.height.equalToSuperview()
                make.leading.equalTo(UIScreen.main.bounds.size.width - jh_getLength(length: 150))
                make.width.equalTo(jh_getLength(length: 150))
            })
        }
        super.updateConstraints()
    }
}
