//
//  SignInCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

final class SignInCoordinator: SignInCoordinatorDependencies {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signInViewController = SignInViewController()
        self.navigationController.viewControllers = [signInViewController]
    }
}
