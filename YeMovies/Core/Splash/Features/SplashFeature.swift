//
//  SplashFeature.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 24.11.2023.
//
//

import Foundation
import ComposableArchitecture

@Reducer
struct SplashFeature: Reducer {
    struct State: Equatable {}

    enum Action: Equatable {
        case appDidLaunch
        case tabs
    }

    var body: some Reducer<State, Action> {
        Reduce { _, action in
            switch action {
            case .appDidLaunch:
                return .send(.tabs)
            case .tabs:
                return .none
            }
        }
    }
}
