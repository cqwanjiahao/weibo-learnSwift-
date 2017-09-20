//
//  UIImage-Extension.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/18.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
import Accelerate

extension UIImage {
    //MARK: - 修正原始方向
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

    //MARK: - 图片进行旋转
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
        
        //CGBitmapContextCreate  创建上下文
        let context = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
                                bitsPerComponent: cgImage!.bitsPerComponent, bytesPerRow: 0,
                                space: cgImage!.colorSpace!, bitmapInfo: cgImage!.bitmapInfo.rawValue)!
        context.concatenate(transform)
        context.draw(cgImage!, in: CGRect(x: 0, y: 0, width: tempSize.width,height: tempSize.height))
        return UIImage(cgImage: context.makeImage()!)
        }
    

    //失败
//    //MARK: - CoreImage处理:高斯模糊图    传入模糊半径 越大越模糊
//    func imageWithGaussianBlur(radiusValue: CGFloat) -> UIImage {
//        let context = CIContext.init(options: nil)
//        let inputImage = self.ciImage
//        //设置filter
////        let filter = CIFilter.init(name: "CIGaussianBlur")
//        let filter = CIFilter.init(name: "CIGaussianBlur")
//        filter?.setValue(inputImage, forKey: kCIInputImageKey)
//        filter?.setValue(radiusValue, forKey: kCIInputRadiusKey)
//        //模糊图片
////        let outputCIImage: CIImage = filter?.outputImage
//        let outputCIImage: CIImage = filter?.value(forKey: kCIOutputImageKey) as! CIImage
//        let rect = CGRect.init(origin: .zero, size: self.size)
//        let blurImage = context.createCGImage(outputCIImage, from: rect)
//        return UIImage.init(cgImage: blurImage!)
//    }
    
    
//    //有时候可以 有时候不行 内存错误
//    func blurryImage(_ level:CGFloat) -> UIImage {
//        var tempLevel = level
//        //高斯模糊参数(0-1)之间，超出范围强行转成0.5
//        if (Float(level) < 0.0 || Float(level) > 1.0){
//            tempLevel = 0.5
//        }
//        var boxSize = Int(tempLevel * 100.0)
//        boxSize -= (boxSize % 2) + 1
//        let imgRef = self.cgImage
//        var inBuffer = vImage_Buffer()
//        var outBuffer = vImage_Buffer()
//        var error = vImage_Error()
//        let inProvider = imgRef?.dataProvider
//        let inBitmapData = inProvider!.data
//        inBuffer.width = vImagePixelCount((imgRef?.width)!)
//        inBuffer.height = vImagePixelCount((imgRef?.height)!)
//        inBuffer.rowBytes = (imgRef?.bytesPerRow)!
//        // void *
//        inBuffer.data = UnsafeMutableRawPointer.init(mutating:CFDataGetBytePtr(inBitmapData!))
//        //手动申请内存
//        let pixelBuffer = malloc(imgRef!.height)
//        outBuffer.data = pixelBuffer
//        outBuffer.width = vImagePixelCount((imgRef?.width)!)
//        outBuffer.height = vImagePixelCount((imgRef?.height)!)
//        outBuffer.rowBytes = (imgRef?.bytesPerRow)!
//        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer,nil,
//                                           0, 0,UInt32(boxSize), UInt32(boxSize),nil,
//                                           vImage_Flags(kvImageEdgeExtend))
//        if(kvImageNoError != error) {
//            error = vImageBoxConvolve_ARGB8888(&inBuffer,
//                                               &outBuffer,nil,vImagePixelCount(0),vImagePixelCount(0),
//                                               UInt32(boxSize),UInt32(boxSize),nil,vImage_Flags(kvImageEdgeExtend))
//        }
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let ctx = CGContext(data: outBuffer.data,
//                           width:Int(outBuffer.width),
//                           height:Int(outBuffer.height),
//                           bitsPerComponent:8,
//                           bytesPerRow: outBuffer.rowBytes,
//                           space: colorSpace,
//                           bitmapInfo:CGImageAlphaInfo.premultipliedLast.rawValue)
//        let imageRef = ctx!.makeImage()
//        //手动释放内存
//        free(pixelBuffer)
//        return UIImage(cgImage: imageRef!)
//    }
}

