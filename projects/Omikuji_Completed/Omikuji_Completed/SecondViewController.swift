//
//  SecondViewController.swift
//  Omikuji
//
//  Created by Yuhel Tanaka on 2019/07/24.
//  Copyright © 2019 Yuhel Tanaka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var tableView:UITableView!
    var settingsArray:[[String:String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.settingsArray = [["title": "ユーザ名設定", "segue": "userNameSetting", "value": self.getUserName()]]
        self.tableView.reloadData()
    }
    
    func getUserName() -> String {
        let userName = UserDefaults.standard.string(forKey: "userName")
        return userName ?? "未設定"
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "tableCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
        let settingsTitle = cell.viewWithTag(1) as! UILabel
        settingsTitle.text = self.settingsArray[indexPath.row]["title"]
        
        let settingsDetail = cell.viewWithTag(2) as! UILabel
        settingsDetail.text = self.settingsArray[indexPath.row]["value"]
        
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        guard let segueIdentifier = self.settingsArray[selectedIndex]["segue"] else {return}

        if !segueIdentifier.isEmpty {
            self.performSegue(withIdentifier: segueIdentifier, sender: self)
        }
    }
}
