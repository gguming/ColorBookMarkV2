//
//  UITextFieldExtension.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/31/24.
//

import UIKit

extension UITextField {
    func setUnderline(color: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-4, width: self.frame.width, height: 4)
        border.backgroundColor = color.cgColor
        border.cornerRadius = 5
        border.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.layer.addSublayer((border))
        self.textAlignment = .center
    }
}
