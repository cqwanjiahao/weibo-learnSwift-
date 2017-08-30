//
//  JHWbHomeTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit
class JHWbHomeTableViewController: JHWbBaseTableViewController {
        lazy var titleButton = JHWbHomeTitleButton()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
}
//class JHWbHomeTableViewController: JHWbBaseTableViewController {
//    lazy var titleButton = JHWbHomeTitleButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//}


// MARK:- 设置UI
extension JHWbHomeTableViewController {
    func setupUI() {
        setupNavigationBar()
        visitorView.setupHomeController()
    }
    
    /// 设置导航条
    override  func setupNavigationBar() {
        super .setupNavigationBar()
        ///设置标题按钮
        titleButton.setTitle("wanjiahao", for: .normal)
        titleButton.addTarget(self, action: #selector(JHWbHomeTableViewController.titleButtonClick), for: .touchUpInside)
        navigationItem.titleView = titleButton
    }
}

// MARK: - 事件监听
extension JHWbHomeTableViewController {
    @objc func titleButtonClick() -> Void {
        titleButton.isSelected = !titleButton.isSelected
        jh_log(messsage: titleButton.isSelected)
    }
}

// MARK: - Table view data source
extension JHWbHomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

