//
//  SearchScreen.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 07.11.2023.
//
//

import Foundation
import ComposableArchitecture

@Reducer
struct SearchScreen: Reducer {
    enum State: Equatable {
        case main(SearchMain.State)
    }

    enum Action: Equatable {
        case main(SearchMain.Action)
    }

    var body: some Reducer<State, Action> {
        Scope(state: /State.main, action: /Action.main) {
            SearchMain()
        }
    }
}
