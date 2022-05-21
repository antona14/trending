//
//  TvShow.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import Foundation

// MARK: - Result
struct TvShow: Codable, Identifiable {
    var id = UUID()
    let tvId: Int
    let genreIDS: [Int]
    let posterPath: String
    let voteCount: Int
    let voteAverage: Double
    let overview, originalName: String
    let name, firstAirDate, backdropPath: String
    let popularity: Double

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case posterPath = "poster_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case tvId = "id"
        case overview
        case originalName = "original_name"
        case name
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case popularity
    }
}

struct AllTvShows: Codable {
    let tvshows: [TvShow]

    enum CodingKeys: String, CodingKey {
        case tvshows = "results"
    }
}

struct allSimilarTv: Codable {
    let tvshows: [TvShow]

    enum CodingKeys: String, CodingKey {
        case tvshows = "results"
    }
}
