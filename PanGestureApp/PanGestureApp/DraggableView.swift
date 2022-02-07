//
//  DraggableView.swift
//  PenGestureApp
//
//  Created by dev jin on 2022/02/07.
//

import Foundation
import UIKit

class DraggableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        // 누르는 순간
        case .began:
            print("began >>>")
        // 눌러서 움직일때
        case .changed:
            // 부모뷰를 기준으로 값을 가져옴
            let delta = pan.translation(in: self.superview)
            // 절대좌표 필요
            var myPosition = self.center
            
            if dragType == .x {
                myPosition.x += delta.x
            } else if dragType == .y  {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            // 변경된 만큼 이동
            self.center = myPosition
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
            
        // 끝났을때, 끌고가서 놔둘때
        case .ended, .cancelled:
            print("ended, cancelled >>>")
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
 
        default:
            break
        }
        
    }
}
