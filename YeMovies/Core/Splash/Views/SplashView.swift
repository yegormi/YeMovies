//
//  SplashView.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 24.11.2023.
//
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
    let store: StoreOf<SplashFeature>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("💫 YeMovies")
                .font(.system(size: 40))
                .bold()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        viewStore.send(.appDidLaunch, animation: .default)
                    }
                }

        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(
            store: Store(initialState: .init()) {
                SplashFeature()
            }
        )
    }
}
