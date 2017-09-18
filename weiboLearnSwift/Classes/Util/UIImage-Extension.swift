//
//  UIImage-Extension.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/18.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
extension UIImage {
    //修正原始方向
    func fixOrientation(img: UIImage) -> UIImage {
        if (img.imageOrientation == .up) {
            return img
        }
        UIGraphicsBeginImageContextWithOptions(img.size, false, img.scale)
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        img.draw(in: rect)
        
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return normalizedImage
    }

    //图片进行旋转
     func rotateImage(ratation: UIImageOrientation) -> UIImage {
        var tempSize = size
        var transform: CGAffineTransform = .identity
        switch  ratation {
        case .up : return self
        case .upMirrored :
            transform = transform.translatedBy(x: size.width, y: 0).scaledBy(x: -1.0, y: 1.0)
        case .down :
            transform = transform.rotated(by: .pi).translatedBy(x: -size.width, y: -size.height)
        case .downMirrored :
            transform = transform.translatedBy(x: -size.width, y: -size.height).scaledBy(x: 1.0, y: -1.0)
        case .left :
            swap(&tempSize.width, &tempSize.height)
            transform = transform.translatedBy(x: size.height, y: 0).rotated(by: (.pi / 2))
        case .leftMirrored :
            swap(&tempSize.width, &tempSize.height)
            transform = transform.translatedBy(x: size.height, y: 0).rotated(by: 3 * (.pi / 2)).scaledBy(x: -1.0, y: 1.0)
        case .right:
            swap(&tempSize.width, &tempSize.height)
            transform = transform.translatedBy(x: 0, y: -size.height).rotated(by: 3 * (.pi / 2))
        case .rightMirrored:
            swap(&tempSize.width, &tempSize.height)
            transform = transform.rotated(by: (.pi / 2)).scaledBy(x: -1.0, y: 1.0)
        }
        
        //CGBitmapContextCreate
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
                                bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0,
                                space: cgImage!.colorSpace!, bitmapInfo: cgImage!.bitmapInfo.rawValue)!
        context.concatenate(transform)
        context.draw(cgImage!, in: CGRect(x: 0, y: 0, width: tempSize.width,height: tempSize.height))
        return UIImage(cgImage: context.makeImage()!)
        }
}

