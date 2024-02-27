//
//  MovieType.swift
//  YeMovies
//
//  Created by Yegor Myropoltsev on 27.02.2024.
//

import Foundation

struct MovieEndpoint {
    enum List: String {
        case nowPlaying = "now_playing"
        case popular = "popular"
        case topRated = "top_rated"
        case upcoming = "upcoming"
    }
}
