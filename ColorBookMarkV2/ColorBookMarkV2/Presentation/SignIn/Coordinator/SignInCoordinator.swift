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
        self.navigationController.viewControllers = [signInViewController]
        
        self.bind(reactor)
        
    }
    
    func bind(_ reactor: SignInReactor) {
        reactor.state
            .map({ $0.isShowNicknameInputView })
            .distinctUntilChanged()
            .withUnretained(self)
            .bind { (coordinator, _) in
                // TODO: 닉네임 입력 화면으로 연결해야함
            }
            .disposed(by: disposeBag)
    }
}
