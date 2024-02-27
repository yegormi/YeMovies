//
//  HomeCoordinator.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.11.2023.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct SearchCoordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        var routes: [Route<SearchScreen.State>]
        static let initialState = State(
            routes: [.root(.main(.init()))]
        )
    }

    enum Action: Equatable, IndexedRouterAction {
        case routeAction(Int, action: SearchScreen.Action)
        case updateRoutes([Route<SearchScreen.State>])
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            default:
                break
            }
            return .none
        }.forEachRoute {
            SearchScreen()
        }
    }
}
