//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

class SegueDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLabel.text = dataString
        
    }

}
