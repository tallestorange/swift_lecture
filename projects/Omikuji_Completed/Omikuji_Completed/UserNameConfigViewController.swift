//
//  UserNameConfigViewController.swift
//  Omikuji
//
//  Created by Yuhel Tanaka on 2019/07/25.
//  Copyright © 2019 Yuhel Tanaka. All rights reserved.
//

import UIKit

class UserNameConfigViewController: UIViewController {
    
    @IBOutlet var userNameLabel:UILabel!
    @IBOutlet var userNameField:UITextField!
    @IBOutlet var saveButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadState()
    }
    
    @IBAction func savedButtonPushed(sender: AnyObject) {
        if self.userNameField.isHidden {
            self.present(self.makeResetDialog(), animated: true, completion: nil)
            return
        }
        guard let userName = self.userNameField.text else {return}
        if userName.isEmpty {
            return
        }
        self.present(self.makeConfirmDialog(), animated: true, completion: nil)
    }
    
    func loadState() {
        let userName = UserDefaults.standard.string(forKey: "userName")
        if let userName = userName {
            self.userNameLabel.text = userName
            self.saveButton.setTitle("初期化", for: .normal)
            self.userNameField.isHidden = true
        }
        else {
            self.userNameLabel.text = "未設定"
            self.saveButton.setTitle("保存", for: .normal)
            self.userNameField.isHidden = false
            self.userNameField.text = ""
        }
    }
    
    func makeConfirmDialog() -> UIAlertController {
        let userName = self.userNameField.text!
        let dialogMessage = "ユーザー名を" + userName + "で登録します。\nよろしいですか？"
        let alertController = UIAlertController(title: "確認", message: dialogMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            let defaults = UserDefaults.standard
            defaults.set(userName, forKey: "userName")
            if defaults.synchronize() {
                self.loadState()
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        return alertController
    }
    
    func makeResetDialog() -> UIAlertController {
        let dialogMessage = "現在登録されているユーザー名を削除します。\nよろしいですか？"
        let alertController = UIAlertController(title: "確認", message: dialogMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction!) in
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "userName")
            if defaults.synchronize() {
                self.loadState()
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        return alertController
    }
    
}
