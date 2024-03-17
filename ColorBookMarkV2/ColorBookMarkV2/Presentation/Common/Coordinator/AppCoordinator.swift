//
//  AppCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    // 테스트용 플래그.
    private var isSignUp: Bool = true
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isSignUp {
            startMainFlow()
        } else {
            startSignInFlow()
        }
    }
    
    func startSignInFlow() {

    }
    
    func startMainFlow() {

    }
    
    
}
