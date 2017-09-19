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
//        if (animated) {
//            selectTitleBtn = navTitleView.attentionBtn
//            selectButtonClick(button:selectTitleBtn!)
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupChildVC()
        setupSubView()
        setupNavigationBar()
        setupContentScrollView()
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
        if !isLogin {
            visitorView.setupHomeController()
        }
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
        //1.修改按钮状态;
        selectTitleBtn?.isEnabled = true
        button.isEnabled = false
        selectTitleBtn = button
        //移动底部下划线   CGAffineTransformTranslate(self.navigationLeftView.subviews.lastObject.transform, transformX, 0);
        var transformX: CGFloat = 0
        if selectTitleBtn == navTitleView.hotTopicBtn {
             transformX = 64
        } else if selectTitleBtn == navTitleView.attentionBtn {
            transformX = 0
        }
        navTitleView.bottomLine.transform  = CGAffineTransform.init(translationX: transformX, y: 0)
//        //移动控制器
//        var offset = contentScrollView.contentOffset
//        offset.x = CGFloat(button.tag) * contentScrollView.jh_width
//        contentScrollView .setContentOffset(offset, animated: true)
    }
    
    @objc func attentionBtnClick() {
        
        if selectTitleBtn == navTitleView.attentionBtn {
            navTitleView.attentionBtn.isSelected = !navTitleView.attentionBtn.isSelected
        } else {
            selectTitleBtn?.isSelected = false
            selectTitleBtn = navTitleView.attentionBtn
            selectTitleBtn?.isSelected = true
        }
    }
    @objc func hotTopicBtnClick() {
        if selectTitleBtn == navTitleView.hotTopicBtn {
            navTitleView.hotTopicBtn.isSelected = !navTitleView.hotTopicBtn.isSelected
        } else {
            selectTitleBtn?.isSelected = false
            selectTitleBtn = navTitleView.hotTopicBtn
            selectTitleBtn?.isSelected = true
        }
        
        let hotTopicPopVC = JHWbHomeHotTopicPopoverCollectionViewController()
        hotTopicPopVC.modalPresentationStyle = .custom
        hotTopicPopVC.transitioningDelegate = popoverAnimator

        present(hotTopicPopVC, animated: true, completion: nil)
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
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        var index: Int = Int((scrollView.contentOffset.x + scrollView.jh_width / 2) / scrollView.jh_width)
        var index = 0
        
        if scrollView.jh_width == 0 {
            index = 0
        }
        let vc: UIViewController = childViewControllers[index]
        contentScrollView.addSubview(vc.view)
        vc.view.snp.makeConstraints { (make) -> Void in
            make.size.top.equalToSuperview()
            make.leading.equalTo(contentScrollView.contentOffset.x)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
        // 点击按钮
        let index: Int = Int((scrollView.contentOffset.x + scrollView.jh_width / 2) / scrollView.jh_width)
        self.selectButtonClick(button: navTitleView.subviews[index + 1] as! JHWbHomeTitleBtn)
    }
    
    
    //获取当前偏移量判断:这一个控制器是不是第一个 或者最后一个  如果是  就启动抽屉效果 如果不是 就关闭抽屉效果
    //这里暂时未使用抽屉效果:关闭
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //获取滑动偏移量    OC方法:let targetX = targetContentOffset -> x   swift方法:let targetX = targetContentOffset.move().x
        //swift获取比较麻烦
        let targetX = targetContentOffset.move().x
        if (targetX == 0 && contentScrollView.contentOffset.x == 0) {
            jh_log(messsage: "firstVC")
//            [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil]; //左边抽屉
        } else if (targetX == CGFloat(childViewControllers.count - 1) * UIScreen.main.bounds.size.width  && (targetX == contentScrollView.contentOffset.x) ) {
            jh_log(messsage: "firstVC")
//            [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];  //右边抽屉
        }
    }
}
