//
//  HomeCoordinatorView.swift
//  SmartWaste
//
//  Created by Yegor Myropoltsev on 07.11.2023.
//
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct SearchCoordinatorView: View {
    let store: StoreOf<SearchCoordinator>

    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .main:
                    CaseLet(
                        /SearchScreen.State.main,
                         action: SearchScreen.Action.main,
                         then: SearchMainView.init
                    )
                }
            }
        }
    }
}
