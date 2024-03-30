//
//  NicknameInputCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/30/24.
//

import UIKit

final class NicknameInputCoordinator: BaseCoordinator {
    override func start() {
        let reactor = NicknameInputReactor(initialState: .init())
        let viewController = NicknameInputViewController()
        
        viewController.reactor = reactor
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
