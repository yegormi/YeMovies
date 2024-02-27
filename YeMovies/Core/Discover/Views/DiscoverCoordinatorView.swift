//
//  DiscoverCoordinatorView.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct DiscoverCoordinatorView: View {
    let store: StoreOf<DiscoverCoordinator>

    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .main:
                    CaseLet(
                        /DiscoverScreen.State.main,
                         action: DiscoverScreen.Action.main,
                         then: DiscoverMainView.init
                    )
                }
            }
        }
    }
}
