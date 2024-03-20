//
//  CaledarTabCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/20/24.
//


import UIKit

final class CaledarTabCoordinator: CalendarTabCoordinatorDependencies {
    var navigationController: UINavigationController
    var caledarTabViewController: CaledarTabViewController
    var childCoordinators: [Coordinator] = []
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.caledarTabViewController = CaledarTabViewController()
    }
    
    func start() {
        self.navigationController.pushViewController(caledarTabViewController, animated: true)
    }
}
