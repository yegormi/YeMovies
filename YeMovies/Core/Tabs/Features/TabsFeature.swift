//
//  TabsFeature.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.11.2023.
//

import Foundation
import ComposableArchitecture
import TCACoordinators

enum Tab: String, CaseIterable, Equatable {
    case discover = "Discover"
    case search = "Search"
}

@Reducer
struct TabsFeature: Reducer {

    struct State: Equatable {
        var discover: DiscoverCoordinator.State
        var search: SearchCoordinator.State
        var selectedTab: Tab
        
        static func initState(from tab: Tab) -> Self {
            Self(
                discover: .initialState,
                search: .initialState,
                selectedTab: tab
            )
        }
    }

    enum Action: Equatable {
        case discover(DiscoverCoordinator.Action)
        case search(SearchCoordinator.Action)
        
        case tabSelected(Tab)
        case goBackToPrevious
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.discover, action: /Action.discover) {
            DiscoverCoordinator()
        }
        Scope(state: \.search, action: /Action.search) {
            SearchCoordinator()
        }
        Reduce { state, action in
            switch action {
            case .tabSelected(let tab):
                if state.selectedTab == tab {
                    return .send(.goBackToPrevious)
                }
                state.selectedTab = tab
                return .none
            case .goBackToPrevious:
                return .none

            case .discover:
                return .none
            case .search:
                return .none
            }
        }
    }
}
