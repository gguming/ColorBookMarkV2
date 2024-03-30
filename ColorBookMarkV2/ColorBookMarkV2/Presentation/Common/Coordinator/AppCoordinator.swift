//
//  AppCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    // 테스트용 플래그.
    private var isSignUp: Bool = false
    
    override func start() {
        self.navigationController.delegate = self
        if isSignUp {
            startMainFlow()
        } else {
            startSignInFlow()
        }
    }
    
    func startSignInFlow() {
        let coordinator = SignInCoordinator(navigationController: navigationController)
        start(childCoordinator: coordinator)
    }
    
    func startMainFlow() {
        let coordinator = MainTabbarCoordinator(navigationController: navigationController)
        start(childCoordinator: coordinator)
    }
    
    
}

extension AppCoordinator: UINavigationControllerDelegate {
    
}
