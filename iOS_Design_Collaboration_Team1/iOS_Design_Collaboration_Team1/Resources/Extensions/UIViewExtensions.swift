//
//  UIViewExtensions.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 선민승 on 2020/11/14.
//

import Foundation
import UIKit

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
    }
    
    func roundedTop(){
        let maskPath1 = UIBezierPath(roundedRect: self.bounds,
                                     byRoundingCorners: [ .topLeft, .topRight ],
                                         cornerRadii: CGSize(width: 40, height: 40))
            let maskLayer1 = CAShapeLayer()
            maskLayer1.frame = bounds
            maskLayer1.path = maskPath1.cgPath
            layer.mask = maskLayer1
        }
}
