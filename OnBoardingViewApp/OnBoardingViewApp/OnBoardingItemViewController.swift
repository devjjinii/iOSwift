//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by dev jin on 2022/02/08.
//

import UIKit

class OnBoardingItemViewController: UIViewController {
    
    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage() // 값이 없을 수도 있어 옵셔널로
    
    // 외부에서 못쓰게 private
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        }
    }
    @IBOutlet private weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        topImageView.image = topImage
        descriptionLabel.text = subText

    }

}
