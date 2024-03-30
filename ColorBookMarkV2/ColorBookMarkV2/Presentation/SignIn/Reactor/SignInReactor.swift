//
//  SignInReactor.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/29/24.
//

import ReactorKit

final class SignInReactor: Reactor {
    var initialState: State
    
    init(initialState: State) {
        self.initialState = initialState
    }
    
    struct State {
        var isShowNicknameInputView: Bool = false
        var nickname: String = ""
        var platform: String = ""
        var token: String = ""

    }
    
    enum Action {
        /// 카카오 로그인 클릭
        case didTappedKakaoButton
        /// 애플 로그인 클릭
        case didTappedAppleButton
    }
    
    enum Mutation {
        case showNicknameInputView(Bool)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTappedKakaoButton:
            Observable.just(Mutation.showNicknameInputView(true))
            
        case .didTappedAppleButton:
            Observable.just(Mutation.showNicknameInputView(true))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .showNicknameInputView(let state):
            newState.isShowNicknameInputView = state
        }
        
        return newState
    }

}

extension SignInReactor {
    
}
