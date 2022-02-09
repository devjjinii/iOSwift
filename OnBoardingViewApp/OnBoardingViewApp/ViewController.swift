//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by dev jin on 2022/02/08.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnboardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 화면 나오기 직전
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 화면이 띄워질때
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if didShowOnboardingView == false {
            didShowOnboardingView = true
            // 노트넘기듯이 넘기는 효과 말고 옆으로 넘기는 효과
            let pageVC = OnboardingPageViewController(
                transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            // 전체화면
            pageVC.modalPresentationStyle = .fullScreen
            
            self.present(pageVC, animated: true, completion: nil)
        }
        
      
    }


}

