//
//  JHWbTimeCountDown.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/10.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbTimeCountDown {
    private var  countDownTimer : Timer?
    var codeBtn = UIButton()
    private var remainingSecond : Int = 0 {
        willSet {
            codeBtn.setTitle("跳过\(newValue)秒", for: .normal)
            if (newValue <= 0){
                codeBtn.setTitle("跳过", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("updateTime")), userInfo: nil, repeats: true)
                remainingSecond = 3
            } else {
                countDownTimer?.invalidate()
                countDownTimer = nil
            }
        }
    }
    
    func updateTime() {
        remainingSecond -= 1
    }
}
