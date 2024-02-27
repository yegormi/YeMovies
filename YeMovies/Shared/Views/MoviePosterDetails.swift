//
//  MoviePosterDetails.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.02.2024.
//

import SwiftUI

struct MoviePosterDetails: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            MoviePosterCard(movie: movie)
                .scaledToFit()
            HStack {
                Text(movie.title)
                    .font(.system(size: 18, weight: .semibold))
                    .lineLimit(2)
                Spacer()
            }
            HStack {
                Text(movie.releaseDateText)
                    .font(.system(size: 14, weight: .regular))
                    .lineLimit(2)
                Spacer()
            }
        }
    }
}

struct MoviePosterDetails_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterDetails(movie: Movie.mockMovies[3])
            .previewLayout(.sizeThatFits)
            .frame(width: 200)

    }
}
