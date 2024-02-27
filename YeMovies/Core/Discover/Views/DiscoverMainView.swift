//
//  DiscoverMainView.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//


import SwiftUI
import ComposableArchitecture

struct DiscoverMainView: View {
    let store: StoreOf<DiscoverMain>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {}
                .onAppear {
                    viewStore.send(.viewDidAppear)
                }
        }
    }
}

struct SDiscoverMainView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMainView(
            store: Store(initialState: DiscoverMain.State()) {
                DiscoverMain()
                    ._printChanges()
            }
        )
    }
}

@Reducer
struct DiscoverMain: Reducer {
    
    struct State: Equatable {
        var viewDidAppear = false
    }
    
    enum Action: Equatable {
        case viewDidAppear
        
    }
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            default :
                return .none
            }
        }
    }
}
