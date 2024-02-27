//
//  HomeMain.swift
//  SmartWaste
//
//  Created by Yegor Myropoltsev on 27.11.2023.
//

import SwiftUI
import ComposableArchitecture

struct SearchMainView: View {
    let store: StoreOf<SearchMain>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {}
                .onAppear {
                    viewStore.send(.viewDidAppear)
                }
        }
    }
}

struct SearchMainView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView(
            store: Store(initialState: SearchMain.State()) {
                SearchMain()
                    ._printChanges()
            }
        )
    }
}

@Reducer
struct SearchMain: Reducer {
    
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
