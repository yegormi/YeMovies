//
//  YeMoviesApp.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct YeMoviesApp: App {
    let store: StoreOf<RootCoordinator>
    
    init() {
        self.store = Store(initialState: .initialState) {
            RootCoordinator()
                ._printChanges()
        }
    }

    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(
                store: self.store
            )
        }
    }
}
