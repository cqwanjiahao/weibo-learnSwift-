//
//  JHWbHomeViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbHomeViewController: JHWbBaseViewController {
    //MARK: - lazyLoad
    private lazy var didSetupConstraints = false
    private lazy var navTitleView = JHWbHomeTitleView()
    private var selectTitleBtn : JHWbHomeTitleBtn? = nil
    private lazy var contentScrollView = UIScrollView()
    private lazy var popoverAnimator = JHWbPopoverAnimator()
    private lazy var attentionVC = JHWbHomeAttentionTableViewController()
    private lazy var hotTopicVC = JHWbHomeHotTopicTableViewController()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (animated) {
            selectTitleBtn = navTitleView.hotTopicBtn
            selectButtonTransform(button:selectTitleBtn!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupChildVC()
        setupSubView()
        setupNavigationBar()
        setupContentScrollView()
        view .updateConstraints()
        view.setNeedsUpdateConstraints()
        }
}

// MARK:- ChildVC
extension JHWbHomeViewController {
    private func setupChildVC() {
        attentionVC.title = "关注"
        addChildViewController(attentionVC)
        hotTopicVC.title = "热点"
        addChildViewController(hotTopicVC)
    }
}

// MARK:- UI
extension JHWbHomeViewController {
     override func setupSubView() {
        super.setupSubView()
        view.addSubview(contentScrollView)
    }
    
    /// 设置导航条
    override  func setupNavigationBar() {
        ///设置标题按钮
        navigationItem.title = ""
        navigationController?.navigationBar.addSubview(navTitleView)
        if isLogin {
            let leftNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            leftNegativeSpacer.width = -10
            let leftButton = UIBarButtonItem.init(imageName: "navigationbar_camera")
            navigationItem.leftBarButtonItems = [leftNegativeSpacer, leftButton]
            
            let rightNegativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            rightNegativeSpacer.width = -10
            let rightButton = UIBarButtonItem.init(imageName: "navigationbar_pop")
            navigationItem.rightBarButtonItems = [rightNegativeSpacer, rightButton]
        } else{
        super .setupNavigationBar()
        }
        setupNavTitleViewEvents()
    }
    
    private func setupContentScrollView() {
        contentScrollView.backgroundColor = .clear
        contentScrollView.delegate = self
        contentScrollView.bounces = false
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsHorizontalScrollIndicator = false
        let contentSizeWidth = view.frame.size.width * CGFloat(childViewControllers.count)
        contentScrollView.contentSize = CGSize.init(width: contentSizeWidth, height: 0)
        scrollViewDidEndScrollingAnimation(contentScrollView)
    }
}

// MARK:- Evens
extension JHWbHomeViewController {
    private func setupNavTitleViewEvents() {
        navTitleView.attentionBtn.addTarget(self, action: #selector(JHWbHomeViewController.selectButtonClick(button:)), for: .touchUpInside)
        navTitleView.hotTopicBtn.addTarget(self, action: #selector(JHWbHomeViewController.selectButtonClick(button:)), for: .touchUpInside)
    }
    
    @objc func selectButtonClick(button: JHWbHomeTitleBtn) {
        selectButtonPopover(button: button)
        selectButtonTransform(button: button)
    }
    
    private func selectButtonPopover(button: JHWbHomeTitleBtn){
        //popover
        if navTitleView.hotTopicBtn.isSelected && navTitleView.hotTopicBtn == button {
//需要为自定义button添加动画:  让按钮旋转180度
            let hotTopicPopVC = JHWbHomeHotTopicPopoverCollectionViewController()
            hotTopicPopVC.modalPresentationStyle = .custom
            hotTopicPopVC.transitioningDelegate = popoverAnimator
            present(hotTopicPopVC, animated: true, completion: nil)
        }
        //1.修改按钮状态;
        selectTitleBtn?.isSelected = false
        selectTitleBtn = button
        selectTitleBtn?.isSelected = true
    }
    
    private func selectButtonTransform(button: JHWbHomeTitleBtn) {
    //移动底部条
        let originX: CGFloat = (navTitleView.bottomLine.jh_x == 0 ? jh_getLength(length: 6) : navTitleView.bottomLine.jh_x)
        let transformX: CGFloat = jh_getLength(length: 6) + CGFloat(button.tag) * jh_getLength(length: 69) - originX
        navTitleView.bottomLine.transform = navTitleView.bottomLine.transform.translatedBy(x: transformX, y: 0)
    //移动控制器
        var offset = contentScrollView.contentOffset
        let contentScrollviewW = UIScreen.main.bounds.size.width     //contentScrollView.jh_width = 0
        offset.x = CGFloat(button.tag) * contentScrollviewW
        contentScrollView .setContentOffset(offset, animated: false)
        scrollViewDidEndScrollingAnimation(contentScrollView)
    }
}

//MARK: - Constraint
extension JHWbHomeViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            didSetupConstraints = true
            navTitleView.snp.makeConstraints({ (make) -> Void in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 120, height: 43))
            })
            contentScrollView.snp.makeConstraints({ (make) -> Void in
                make.edges.equalToSuperview()
            })
        }
        super.updateViewConstraints()
    }
}
//MARK: - UIScrollViewDelegate
extension JHWbHomeViewController : UIScrollViewDelegate {
    //非人为滚动完毕
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //默认加载hotTopic控制器
        let scrollViewW = UIScreen.main.bounds.size.width  //scrollView.jh_width = 0 所以手动设置
        let index: Int = Int((scrollView.contentOffset.x + scrollViewW / 2) / scrollViewW)
        let vc: UIViewController = childViewControllers[index]
        contentScrollView.addSubview(vc.view)
        vc.view.snp.makeConstraints { (make) -> Void in
            make.size.top.equalToSuperview()
            make.leading.equalTo(contentScrollView.contentOffset.x)
        }
    }
    
    //人为滚动完毕
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
        // 点击按钮
        let index: Int = Int((scrollView.contentOffset.x + scrollView.jh_width / 2) / scrollView.jh_width)
        self.selectButtonTransform(button: navTitleView.subviews[index] as! JHWbHomeTitleBtn)
        
    }
}

//MARK: - 抽屉效果
////获取当前偏移量判断:这一个控制器是不是第一个 或者最后一个  如果是  就启动抽屉效果 如果不是 就关闭抽屉效果
////这里暂时未使用抽屉效果:关闭
//func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    //获取滑动偏移量    OC方法:let targetX = targetContentOffset -> x   swift方法:let targetX = targetContentOffset.move().x
//    //swift获取比较麻烦
//    let targetX = targetContentOffset.move().x
//    if (targetX == 0 && contentScrollView.contentOffset.x == 0) {
//        jh_log(messsage: "firstVC")
//        //            [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil]; //左边抽屉
//    } else if (targetX == CGFloat(childViewControllers.count - 1) * UIScreen.main.bounds.size.width  && (targetX == contentScrollView.contentOffset.x) ) {
//        jh_log(messsage: "lastVC")
//        //            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];  //右边抽屉
//    }
//}
