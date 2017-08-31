//
//  JHWbMeTableViewController.swift
//  weiboLearnSwift
//
//  Created by 万家豪 on 2017/8/22.
//  Copyright © 2017年 万家豪. All rights reserved.
//

import UIKit

class JHWbMeTableViewController: JHWbBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
        setupUI()
    }
}

// MARK: - 设置UI
extension JHWbMeTableViewController {
    func setupUI() -> Void {
        visitorView.setupMeController()
    }
   override func setupNavigationBar() {
        navigationItem.title = "我"
        navigationItem.rightBarButtonItem?.tintColor = UIColor.darkGray
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style:.plain, target: self, action: #selector(JHWbMeTableViewController.settingButtonClick))
    }
}
//MARK: - 事件监听
extension JHWbMeTableViewController {
    @objc func settingButtonClick() {
        jh_log(messsage: "点击了监听按钮")
    }
}

// MARK: - Table view data source
extension JHWbMeTableViewController {
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
