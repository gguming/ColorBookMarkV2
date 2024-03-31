//
//  NicknameInputReactor.swift
//  ColorBookMarkV2
//
//  Created by SUN on 3/30/24.
//

import ReactorKit

final class NicknameInputReactor: Reactor {
    
    var initialState: State
    
    init(initialState: State) {
        self.initialState = initialState
    }
    
    struct State {
        var nicknameInput: String = ""
        var isActiveContinueButton: Bool = false
    }
    
    enum Mutation {
        case inputNickname(String)
        case setContinueButton(Bool)
    }
    
    enum Action {
        /// 계속하기 버튼 클릭
        case didTappedContinueButton
        /// textfield input 입력
        case updateNickname(String)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .didTappedContinueButton:
            Observable.just(Mutation.setContinueButton(false))
            
        case .updateNickname(let input):
            Observable.just(Mutation.inputNickname(input))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .inputNickname(let input):
            newState.nicknameInput = input
            
        case .setContinueButton(let flag):
            newState.isActiveContinueButton = flag
        }
        
        return newState
    }
    
    
}
