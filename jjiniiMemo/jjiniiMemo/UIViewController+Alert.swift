//
//  UIViewController+Alert.swift
//  jjiniiMemo
//
//  Created by dev jin on 2021/04/16.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) //.actionSheet
    
    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
    present(alert, animated: true, completion: nil)
        
    }
}
