//
//  DetailViewController.swift
//  PassData
//
//  Created by dev jin on 2022/02/03.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = ""
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString
    }


}
