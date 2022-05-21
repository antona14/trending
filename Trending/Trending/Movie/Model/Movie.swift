//
//  Movie.swift
//  Trending
//
//  Created by Anton on 08/02/2022.
//

import Foundation


struct Movie: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let originalTitle: String
    let title: String
    let poster: String
    let overview: String
    let releaseDate: String
    let backdrop: String?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case originalTitle = "original_title"
        case title
        case poster = "poster_path"
        case overview
        case releaseDate = "release_date"
        case backdrop = "backdrop_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
    }
}

struct AllMovies: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        
        // This is an array with all the movies
        case movies = "results"
    }
}

struct AllSimilarMovies: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        // This is an array with all the movies
        case movies = "results"
    }
}
