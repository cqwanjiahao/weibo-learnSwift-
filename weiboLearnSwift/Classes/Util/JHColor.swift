//
//  JHColor.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/24.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
extension UIColor {
    //GRB颜色
    class func jh_setColor(rgb: CGFloat) -> UIColor {
        return .RGBA(red: rgb, green: rgb, blue: rgb, alpha: 1.0)
    }

    class func jh_setColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return .RGBA(red: r, green: g, blue: b, alpha: 1.0)
    }

    class func jh_setColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return .RGBA(red: r, green: g, blue: b, alpha: a)
    }
    
    ///16进制颜色
    class func jh_setHexStringColor(hex: String) -> UIColor {
        return .HEXCOLORA(hex:hex, alpha:1.0)
    }

    class func jh_setHexStringColor(hex: String, alpha: CGFloat) -> UIColor {
        return .HEXCOLORA(hex:hex, alpha:alpha)
    }
    ///随机色
    class func jh_randomColor() -> UIColor {
        return .RGBA(red: CGFloat(arc4random_uniform(256)), green: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)), alpha: 1.0)
    }
}

extension UIColor {
    class func RGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor.init(red:red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: CGFloat(alpha))
    }
  
    class func HEXCOLORA(hex: String, alpha: CGFloat) -> UIColor {
        var red: UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        Scanner(string: hex[1..<3]).scanHexInt32(&red)
        Scanner(string: hex[3..<5]).scanHexInt32(&green)
        Scanner(string: hex[5..<7]).scanHexInt32(&blue)
        
        print(CGFloat(red))
//        print(Scanner(string: hex[1..<3]))
        print(CGFloat(green))
//        print(Scanner(string: hex[3..<5]))
        print(CGFloat(blue))
//        print(Scanner(string: hex[5..<7]))
        return .RGBA(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: alpha)
//        return RGBA(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}

extension String {
    /// String使用下标截取字符串
    /// 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (range: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
//            print(String(self[startIndex..<endIndex]))
            return String(self[startIndex..<endIndex])
        }
    }
}
