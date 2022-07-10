//
//  UIView+.swift
//  Clone-Toss
//
//  Created by itzel.du on 2022/07/07.
//

import UIKit

typealias CTImage = UIImage

extension UIView {
    func circle(){
        let radius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.roundedCorner(radius: radius)
    }
    
    func roundedCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
