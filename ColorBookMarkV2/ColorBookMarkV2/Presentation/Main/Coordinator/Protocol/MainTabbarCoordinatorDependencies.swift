//
//  MainTabbarCoordinatorDependencies.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import Foundation

protocol MainTabbarCoordinatorDependencies: Coordinator {
    var tabBarController: BaseTabbarController { get set }
    func selectTab(_ tab: MainTabbar)
    func setSelectedIndex(_ index: Int)
    func currentTab() -> MainTabbar?
}
