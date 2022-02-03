//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

class ClosureDetailViewController: UIViewController {

    var myClosure: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func clousrePassData(_ sender: Any) {
        
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
