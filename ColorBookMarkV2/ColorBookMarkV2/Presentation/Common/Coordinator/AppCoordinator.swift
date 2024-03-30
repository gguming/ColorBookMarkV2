//
//  AppCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    // 테스트용 플래그.
    private var isSignUp: Bool = true
    
    override func start() {
        if isSignUp {
            startMainFlow()
        } else {
            startSignInFlow()
        }
    }
    
    func startSignInFlow() {
        let coordinator = SignInCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func startMainFlow() {
        let coordinator = MainTabbarCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    
}
