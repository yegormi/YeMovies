//
//  DiscoverScreen.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct DiscoverScreen: Reducer {
    enum State: Equatable {
        case main(DiscoverMain.State)
    }

    enum Action: Equatable {
        case main(DiscoverMain.Action)
    }

    var body: some Reducer<State, Action> {
        Scope(state: /State.main, action: /Action.main) {
            DiscoverMain()
        }
    }
}
