//
//  JHWbComposeViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/23.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbComposeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true) {
        }
    }
}

