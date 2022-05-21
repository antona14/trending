//
//  MovieViewModel.swift
//  Trending
//
//  Created by Anton on 08/02/2022.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
        
    var cancellationToken: AnyCancellable?
    
    init() {
        getMovies()
    }
}

extension MovieViewModel {
    
    // Subscriber
    func getMovies() {
        cancellationToken = MovieDB.request(path: "trending/movie/week")
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
