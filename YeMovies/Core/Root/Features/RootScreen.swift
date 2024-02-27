//
//  RootScreen.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 07.11.2023.
//
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootScreen: Reducer {
    enum State: Equatable {
        case splash(SplashFeature.State)
        case tabs(TabsFeature.State)
    }

    enum Action: Equatable {
        case splash(SplashFeature.Action)
        case tabs(TabsFeature.Action)
    }

    var body: some Reducer<State, Action> {
        Scope(state: /State.splash, action: /Action.splash) {
            SplashFeature()
        }
        Scope(state: /State.tabs, action: /Action.tabs) {
            TabsFeature()
        }
    }
}
