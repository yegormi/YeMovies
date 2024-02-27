//
//  MoviePosterCard.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 26.02.2024.
//

import CachedAsyncImage
import SwiftUI

struct MoviePosterCard: View {
    let movie: Movie
    
    var body: some View {
        ZStack {
            CachedAsyncImage(url: movie.posterURL){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .shadow(radius: 4)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: Movie.mockMovies[13])
            .previewLayout(.sizeThatFits)
    }
}
