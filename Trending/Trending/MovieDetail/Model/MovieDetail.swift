//
//  detail.swift
//  Trending
//
//  Created by Anton on 15/02/2022.
//

import Foundation

struct MovieDetail: Codable, Identifiable {
    var id = UUID()
    let movieId: Int
    let budget: Int
    let revenue: Int
    let homepage: String?
    let originalTitle: String
    let title: String
    let poster: String
    let overview: String
    let releaseDate: String
    let backdrop: String
    let imdbId: String
    let tagline: String
    let runtime: Int
    let popularity: Double

    enum CodingKeys: String, CodingKey {
        case movieId = "id"
        case budget
        case revenue
        case homepage
        case originalTitle = "original_title"
        case title
        case poster = "poster_path"
        case overview
        case releaseDate = "release_date"
        case backdrop = "backdrop_path"
        case imdbId = "imdb_id"
        case tagline
        case runtime
        case popularity
    }
}
