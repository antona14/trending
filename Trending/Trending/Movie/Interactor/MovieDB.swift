//
//  MovieDBAPI.swift.swift
//  Trending
//
//  Created by Anton on 08/02/2022.
//

import Foundation
import Combine

enum MovieDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
}

extension MovieDB {
    
    static func request(path: String) -> AnyPublisher<AllMovies, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "173299f7414048733419c33f8ede6645")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}




