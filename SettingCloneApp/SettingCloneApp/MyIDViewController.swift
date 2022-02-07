//
//  MyIDViewController.swift
//  SettingCloneApp
//
//  Created by dev jin on 2022/02/07.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton! {
        // 3. 보통 이런식으로 진행
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    // 눌렀을때 행동
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 셋팅 접속 후, 처음 ID 클릭시 NEXT 활성화되어있음.
        // 1. nextButton.isEnabled = false
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
//        2. textFieldDidChange(sender: emailTextField)
    }
    
    // selector -> @objc
    @objc func textFieldDidChange(sender: UITextField) {
//        print(sender.text ?? "")
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
            
        } else {
            nextButton.isEnabled = true
        }
        
    }

}
