//
//  MoviePosterCarousel.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.02.2024.
//

import SwiftUI

struct MoviePosterCarousel: View {
    let headline: String
    let movies: [Movie]
    
    init(_ headline: String, with movies: [Movie]) {
        self.headline = headline
        self.movies = movies
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(headline)
                    .font(.system(size: 40, weight: .bold))
                Spacer()
            }
            .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(movies) { movie in
                        MoviePosterDetails(movie: movie)
                            .frame(width: 150)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 10)
    }
}

struct MoviePosterCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarousel("Mock", with: Movie.mockMovies)
            .previewLayout(.sizeThatFits)
    }
}

