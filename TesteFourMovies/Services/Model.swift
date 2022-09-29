//
//  Model.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import Foundation

struct KeyAcess {
    
    static let villarKey = "644c3fb568510b2779c8f2b277ed5f25"
}

enum EndPoints: String {
    
    case image = "https://image.tmdb.org/t/p/original"
    case movies = "https://api.themoviedb.org/3/movie"
    case genrers = "https://api.themoviedb.org/3/genre"
}


