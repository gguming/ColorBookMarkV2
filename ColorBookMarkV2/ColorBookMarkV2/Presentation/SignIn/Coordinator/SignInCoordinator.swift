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
    private var signInViewController: SignInViewController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.signInViewController = SignInViewController()
    }
    
    func start() {
        self.navigationController.viewControllers = [signInViewController]
    }
}
