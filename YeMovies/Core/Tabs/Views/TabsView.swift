//
//  TabsView.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct TabsView: View {
    let store: StoreOf<TabsFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                TabView(
                    selection: viewStore.binding(
                        get: \.selectedTab,
                        send: TabsFeature.Action.tabSelected
                    )
                ) {
                    DiscoverCoordinatorView(
                        store: self.store.scope(
                            state: \.discover,
                            action: \.discover
                        )
                    )
                    .tabItem { Label("Discover", systemImage: "house.fill") }
                    .tag(Tab.discover)

                    SearchCoordinatorView(
                        store: self.store.scope(
                            state: \.search,
                            action: \.search
                        )
                    )
                    .tabItem { Label("Search", systemImage: "magnifyingglass") }
                    .tag(Tab.search)

                }
                .accentColor(.yellow)
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(
            store: Store(initialState: .initState(from: .discover)) {
                TabsFeature()
                    ._printChanges()
            }
        )
    }
}
