//
//  CaledarTabCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/20/24.
//


import UIKit

final class CaledarTabCoordinator: BaseCoordinator {
    
    override func start() {
        let caledarTabViewController = CaledarTabViewController()
        self.navigationController.pushViewController(caledarTabViewController, animated: true)
    }
}
