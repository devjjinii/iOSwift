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

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
//        print("Button Click")
//        diceImageViewOne.image = #imageLiteral(resourceName: "3")
//        diceImageViewTwo.image = #imageLiteral(resourceName: "1")
        let diceArray = [ #imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "5"), #imageLiteral(resourceName: "6") ]
        
        diceImageViewOne.image = diceArray[Int.random(in: 0...5)]
        diceImageViewTwo.image = diceArray[Int.random(in: 0...5)]
    }
    
}

