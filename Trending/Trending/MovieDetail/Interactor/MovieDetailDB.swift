//
//  DetailDB.swift
//  Trending
//
//  Created by Anton on 18/02/2022.
//

import Foundation
import Combine


enum MovieDetailDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
}

extension MovieDetailDB {
    
    static func request(path: String) -> AnyPublisher<MovieDetail, Error> {
        
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "173299f7414048733419c33f8ede6645")]
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
