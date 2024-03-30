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
    }
    
    enum Action {
        
    }
    
    
}
