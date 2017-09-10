//
//  JHWbMobileTextField.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/8.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMobileTextField: UITextField {
    //系统回调
    public init(target: Any?, action: Selector) {
        super.init(frame: CGRect.zero)
        clearButtonMode = .whileEditing
        keyboardType = .numberPad
        attributedPlaceholder = NSAttributedString.init(string: "手机号", attributes: [NSAttributedStringKey.foregroundColor : UIColor.jh_setColor(rgb: 198)])
        font = .systemFont(ofSize: jh_getLength(length: 17))
        addTarget(target, action: action, for: .editingChanged)
        textAlignment = .left
    }
    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }
}
