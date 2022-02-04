//
//  ViewController.swift
//  PassData ( 데이터를 넘겨주는 방법)
//
//  Created by dev jin on 2022/02/03.
//

// 1. instance property
// 2. segue
// 3. instance
// 4. delegate (delegation) pattern 대리 위임 )
// 5. closure
// 6. Notification

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 연결점이 없는 상황에서 데이터 전송 >> Notification
        let notifiactionName = Notification.Name("sendSomeStringData")
       
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notifiactionName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // removeObserver
    }

    @objc func keyboardWillShow() {
        print("will show")
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "hi"
            }
        }
    }

    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "aaa"
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
    
        detailVC.delegate = self //프로토콜
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = { str in
            self.dataLabel.text = str
            
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToNoti(_ sender: Any) {

        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        
        self.present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }

}
