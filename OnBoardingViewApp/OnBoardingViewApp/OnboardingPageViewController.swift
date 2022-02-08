//
//  OnboardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by dev jin on 2022/02/08.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 뷰 컨르롤러
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        
        itemVC1.mainText = "첫번째"
        itemVC1.topImage = UIImage(named: "jjiniicute")
        itemVC1.subText = "귀여운찌니"
        


        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        
        itemVC2.mainText = "두번째"
        itemVC2.topImage = UIImage(named: "jjinii2")
        itemVC2.subText = "귀여운찌짜니"
        
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        
        itemVC3.mainText = "세번째"
        itemVC3.topImage = UIImage(named: "jjinii3")
        itemVC3.subText = "귀여운찌짜니이이이"
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
    }
    
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
        
    }
    
    
}
