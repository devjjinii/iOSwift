//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func notiAction(_ sender: Any) {
        
        let notifiactionName = Notification.Name("sendSomeStringData")
        
        let strDic = ["str" : "noti string"]
        
        NotificationCenter.default.post(name: notifiactionName, object: nil, userInfo: strDic)
    }
}
