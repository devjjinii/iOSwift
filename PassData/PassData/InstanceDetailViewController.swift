//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

class InstanceDetailViewController: UIViewController {
    
    var mainVC: ViewController? // 나자신의 인스턴스를 넘김
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendDataMainVc(_ sender: Any) {
        mainVC?.dataLabel.text = "some data"
        self.dismiss(animated: true, completion: nil)
    }

}
