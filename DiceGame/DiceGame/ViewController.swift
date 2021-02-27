//
//  ViewController.swift
//  DiceGame
//
//  Created by dev jin on 2021/02/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        diceImageViewOne.image = #imageLiteral(resourceName: "2")
        diceImageViewTwo.image = #imageLiteral(resourceName: "6")
    
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button Click")
        
        diceImageViewOne.image = #imageLiteral(resourceName: "3")
        diceImageViewTwo.image = #imageLiteral(resourceName: "1")
    }
    
}

