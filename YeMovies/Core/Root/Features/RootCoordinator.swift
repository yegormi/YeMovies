//
//  RootCoordinator.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 24.11.2023.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

@Reducer
struct RootCoordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        var routes: [Route<RootScreen.State>]
        static let initialState = State(
            routes: [.root(.splash(.init()))]
        )
    }

    enum Action: IndexedRouterAction {
        case routeAction(Int, action: RootScreen.Action)
        case updateRoutes([Route<RootScreen.State>])
    }

    var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .splash(.tabs)):
                state.routes.removeAll()
                state.routes.push(.tabs(.initState(from: .discover)))
            default:
                break
            }
            return .none
        }.forEachRoute {
            RootScreen()
        }
    }
}
