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
            VStack {
                MoviePosterCarousel("Popular", with: viewStore.movies)
                Spacer()
            }
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
    @Dependency(\.movieCleint) var movieClient
    
    struct State: Equatable {
        var viewDidAppear = false
        var movies: [Movie] = []
    }
    
    enum Action: Equatable {
        case viewDidAppear
        case fetchMovies
        case fetchMoviesSuccess([Movie])
        
    }
    
    var body: some Reducer<State, Action> {
        Reduce<State, Action> { state, action in
            switch action {
            case .viewDidAppear:
                state.viewDidAppear = true
                return .send(.fetchMovies)
            case .fetchMovies:
                return .run { send in
                    do {
                        let movies = try await fetchMovies()
                        await send(.fetchMoviesSuccess(movies))
                    } catch {
                        print(error)
                    }
                }
            case .fetchMoviesSuccess(let movies):
                state.movies = movies
                return .none
            }
        }
    }
}

extension DiscoverMain {
    func fetchMovies() async throws -> [Movie] {
        let response = try await movieClient.fetchMovies(type: .popular)
        return response.results
    }
}
