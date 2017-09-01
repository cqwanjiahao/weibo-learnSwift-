//
//  JHWbLoginViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbLoginViewController: UIViewController {
    //MARK: - 控件属性
    
    @IBOutlet weak var areaInfolabel: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var moblieTextField: UITextField!
    
    class func LoginViewController() -> UIViewController {
        let loginViewController = Bundle.main.loadNibNamed("JHWbLoginViewController", owner: nil, options: nil)?.first as! UIViewController
        let loginNav = UINavigationController.init(rootViewController: loginViewController)
        return loginNav
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        areaInfolabel.titleLabel?.text = "haha"
        setupUI()
        addAGesutreRecognizerForScrollView()
    }
}

extension JHWbLoginViewController {
    func setupUI() {
        jh_log(messsage: mainScrollView.frame)
        mainScrollView.contentSize = CGSize.init(width: 0, height: 610)
        mainScrollView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 100, right: 0)
    }

}
// MARK: - 事件监听
extension JHWbLoginViewController {
//区域选择按钮
    @IBAction func areaButtonClick(_ sender: Any) {
        let areaPickstoryboard = UIStoryboard.init(name: "JHWbAreaPickTableViewController", bundle: nil)
        let areaPickVC : JHWbAreaPickTableViewController = areaPickstoryboard.instantiateInitialViewController() as! JHWbAreaPickTableViewController
        navigationController?.pushViewController(areaPickVC, animated: true)
    }
    
    //取消按钮
    @IBAction func cancelButtonClick(_ sender: UIButton) {
        dismiss(animated: true) {
        }
    }
    
    //注册按钮
    @IBAction func registeButtonClick(_ sender: UIButton) {
        errorLable.isHidden = false
    }
    
    //退出键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moblieTextField.resignFirstResponder()
    }
    //MARK : 给scrollView添加手势
    func addAGesutreRecognizerForScrollView() {
        let tapGesture = UITapGestureRecognizer.init(target: self, action:#selector(JHWbLoginViewController.tapGestureClick))
        mainScrollView.addGestureRecognizer(tapGesture)
    }
    @objc func tapGestureClick(recognizer : UITapGestureRecognizer) {
        moblieTextField.resignFirstResponder()
    }
    //swift4 中无法重写 这个方法
    //        mainScrollView.hitTest(<#T##point: CGPoint##CGPoint#>, with: <#T##UIEvent?#>)
    //        mainScrollView.point(inside: <#T##CGPoint#>, with: <#T##UIEvent?#>)
    //    override func hitTest(_ point: CGPoint, with event: UIEvent?) {
    //        return mainScrollView
    //    }
}

