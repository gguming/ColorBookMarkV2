//
//  SignInCoordinator.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/17/24.
//

import UIKit
import RxSwift

final class SignInCoordinator: BaseCoordinator {
    override func start() {
        let signInViewController = SignInViewController()
        let reactor = SignInReactor(initialState: .init())
        signInViewController.reactor = reactor
        signInViewController.coordinator = self
        self.bind(reactor)
        
        self.navigationController.setViewControllers([signInViewController], animated: true)
    }
    
    func bind(_ reactor: SignInReactor) {
        reactor.state
            .map({ $0.isShowNicknameInputView })
            .filter { $0 }
            .withUnretained(self)
            .bind { (coordinator, _) in
                let nickNameInputCoordinator = NicknameInputCoordinator(navigationController: coordinator.navigationController)
                nickNameInputCoordinator.start(childCoordinator: nickNameInputCoordinator)
                
            }
            .disposed(by: disposeBag)
    }
}
