//
//  JHWbAdvertViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/10.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbAdvertViewController: UIViewController {
    private var didSetupConstraints = false
    
    //MARK: - lazyload
    private lazy var backgroundImageView = UIImageView.init(image: #imageLiteral(resourceName: "ad_background"))
    private lazy var passBtn = { () -> UIButton in
        let passBtn = UIButton()
        passBtn.titleLabel?.textAlignment = .center
        passBtn.setTitleColor(UIColor.jh_setColor(rgb: 168), for: .normal)
        passBtn.titleLabel?.font = .systemFont(ofSize: self.jh_getLength(length: 16))
        passBtn.layer.borderColor = UIColor.jh_setColor(rgb: 236).cgColor
        passBtn.layer.borderWidth = 1
        passBtn.layer.cornerRadius = jh_getLength(length: 20)
        passBtn.layer.masksToBounds = true
        passBtn.addTarget(self, action: #selector(JHWbAdvertViewController.passBtnClick), for: .touchUpInside)
        return passBtn
    }()
    private lazy var advertImageView = UIImageView.init(image: #imageLiteral(resourceName: "ad_1"))
    
    //MARK: - 计时器
    private var remainingSeconds = 0
    private var countdownTimer: Timer?

    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
        calculateTime()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
        }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}


// MARK:- setupView
extension JHWbAdvertViewController {
    private func setupSubView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(advertImageView)
        view.addSubview(passBtn)
    }
}

// MARK:- 倒计时跳过
extension JHWbAdvertViewController {
    private func calculateTime() {
        remainingSeconds = 3
        passBtn.setTitle("跳过(\(remainingSeconds))", for: .normal)
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(JHWbAdvertViewController.checkCountDown), userInfo: nil, repeats: true)
    }

    @objc private func checkCountDown() {
        remainingSeconds -= 1
        passBtn.setTitle("跳过(\(remainingSeconds))", for: .normal)
        if remainingSeconds == 0 {
            passBtnClick()
        }
    }
}

// MARK:- constraints
extension JHWbAdvertViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            
            backgroundImageView.snp.makeConstraints { (make) -> Void in
                make.size.equalToSuperview()
                make.center.equalToSuperview()
            }
            
            advertImageView.snp.makeConstraints { (make) -> Void in
                make.top.leading.width.equalToSuperview()
                make.height.equalTo(jh_getLength(length: 595))
            }
            
            passBtn.snp.makeConstraints { (make) -> Void in
                make.bottom.equalToSuperview().offset(jh_getLength(length: -25))
                make.trailing.equalToSuperview().offset(jh_getLength(length: -15))
                make.size.equalTo(jh_getsize(x: 90, y: 40))
            }
        }
        super .updateViewConstraints()
    }
}

// MARK: - Events
extension JHWbAdvertViewController {
    @objc private func passBtnClick() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        let mainVC = JHWbMainViewController()
        present(mainVC, animated: false) {
        }
    }
}
