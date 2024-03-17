//
//  BaseTabbarController.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

final class BaseTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    private func setupTabbar() {
        UITabBar.clearShadow()
        self.tabBar.layer.applyShadow(color: .black, alpha: 0.05, y: -2, blur: 6)
        tabBar.layer.cornerRadius = tabBar.frame.height * 0.3
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}
