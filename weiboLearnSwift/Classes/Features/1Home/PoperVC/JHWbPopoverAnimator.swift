//
//  JHWbPopoverAnimator.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/9/18.
//  Copyright © 2017年 万家豪. All rights reserved.
//
//自定义转场动画: 从上到下

import UIKit

class JHWbPopoverAnimator: NSObject {
    private lazy var isPresented = false
}

// MARK: - 自定义转场代理
extension JHWbPopoverAnimator : UIViewControllerTransitioningDelegate {
    ///改变控制器尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return JHWbHotTopictPopoverPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
    ///自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        return self
    }
    
    ///自定义消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        return self
    }
}



// MARK: - 弹出和消失代理的方法
extension JHWbPopoverAnimator : UIViewControllerAnimatedTransitioning {
    //动画执行时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    //获取转场的上下文: 可以通过转场上下文获取弹出的view和消失的view
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresented {
            presentAnimate(transitionContext: transitionContext)
        } else {
            dismissAnimate(transitionContext: transitionContext)
        }
    }
    
    private func presentAnimate(transitionContext: UIViewControllerContextTransitioning) {
        //获取弹出的view
        // UITransitionContextFromViewKey, and UITransitionContextToViewKey
        let presentView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        //弹出动画:   弹出的view添加到vontainerView中
        transitionContext.containerView.addSubview(presentView)
        //执行动画
        presentView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.0)
        //锚点在中间 所以缩放是中间开始
        presentView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            presentView.transform = CGAffineTransform.identity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
    
    private func dismissAnimate(transitionContext: UIViewControllerContextTransitioning) {
        let dissmissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        //弹出动画:   弹出的view添加到vontainerView中
        transitionContext.containerView.addSubview(dissmissView)
        //锚点在中间 所以缩放是中间开始
        //        dissmissView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            dissmissView.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.00001)
        }) { (_) in
            dissmissView.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
    }
}
