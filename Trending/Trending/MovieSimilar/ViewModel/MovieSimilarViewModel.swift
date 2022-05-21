//
//  MovieSimilarViewModel.swift
//  Trending
//
//  Created by Anton on 28/02/2022.
//

import Foundation
import Combine

class MovieSimilarViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    
    var cancellationToken: AnyCancellable?
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        getSimilarMovies(id: id)
    }
}

extension MovieSimilarViewModel {
    
    func getSimilarMovies(id: Int) {
        cancellationToken = MovieSimilarDB.request(path: "movie/\(id)/similar")
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                self.movies = $0.movies
            })
    }
}
