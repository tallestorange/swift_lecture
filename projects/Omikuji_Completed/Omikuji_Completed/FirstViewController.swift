//
//  FirstViewController.swift
//  Omikuji
//
//  Created by Yuhel Tanaka on 2019/07/24.
//  Copyright © 2019 Yuhel Tanaka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var omikujiResultLabel:UILabel!
    @IBOutlet var currentDateLabel:UILabel!
    @IBOutlet var resultLoadingView:UIView!
    @IBOutlet var submitButton:UIButton!
    @IBOutlet var navigationBarItem:UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userName = UserDefaults.standard.string(forKey: "userName")
        if let userName = userName {
            self.navigationBarItem.title = userName + "さん"
        }
        else {
            self.navigationBarItem.title = "ユーザーさん"
        }
        self.currentDateLabel.text = self.getDateString()
    }
    
    func getDateString() -> String {
        let nowDate = Date()
        let gcalendar = Calendar(identifier: .gregorian)
        let format = DateFormatter()
        format.calendar = gcalendar
        format.locale = Locale(identifier: "ja_JP")
        format.dateFormat = "yyyy年MM月dd日"
        return format.string(from: nowDate)
    }
    
    func getResultString() -> String {
        let results = ["大吉", "中吉", "小吉", "吉", "末吉", "凶", "大凶"]
        let randInt = Int(arc4random_uniform(7))
        
        let result = results[randInt]
        return "今日の運勢は" + result + "でした！"
    }

    @IBAction func resultButtonPushed(sender: AnyObject) {
        self.resultLoadingView.isHidden = false
        let wait_seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + wait_seconds) {
            self.resultLoadingView.isHidden = true
            self.omikujiResultLabel.text = self.getResultString()
            self.submitButton.isEnabled = false
        }
    }
}

