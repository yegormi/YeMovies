//
//  DiscoverCoordinator.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct DiscoverCoordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        var routes: [Route<DiscoverScreen.State>]
        static let initialState = State(
            routes: [.root(.main(.init()))]
        )
    }

    enum Action: Equatable, IndexedRouterAction {
        case routeAction(Int, action: DiscoverScreen.Action)
        case updateRoutes([Route<DiscoverScreen.State>])
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { _, action in
            switch action {
            default:
                break
            }
            return .none
        }.forEachRoute {
            DiscoverScreen()
        }
    }
}
