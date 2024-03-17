//
//  CALayerExtension.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

extension CALayer {
    // 그림자 생성
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}
