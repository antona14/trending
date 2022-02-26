//
//  TvDetail.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import Foundation

struct TvDetail: Codable, Identifiable {
    var id = UUID()
    let adult: Bool
    let backdropPath: String
    let episodeRunTime: [Int]
    let firstAirDate: String
    let homepage: String
    let tvId: Int
    let inProduction: Bool
    let languages: [String]
    let lastAirDate: String
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    let originCountry: [String]
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String
    let status, tagline, type: String
    let voteCount: Int
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case tvId = "id"
        case adult
        case backdropPath = "backdrop_path"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case homepage
        case inProduction = "in_production"
        case languages
        case lastAirDate = "last_air_date"
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case status, tagline, type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
