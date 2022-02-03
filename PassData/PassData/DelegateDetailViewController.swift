//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {
    
    weak var delegate: DelegateDetailViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate pass data")
        self.dismiss(animated: true, completion: nil)
    }
}
