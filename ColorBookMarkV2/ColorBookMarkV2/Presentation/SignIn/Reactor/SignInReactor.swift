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

}

extension SignInReactor {
    
}
