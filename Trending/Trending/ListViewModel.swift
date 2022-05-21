//
//  ListViewModel.swift
//  Trending
//
//  Created by Anton on 01/03/2022.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var tvshows: [TvShow] = []
        
    var cancellationToken: AnyCancellable?
    
//    let type: String
    
    init() {
//        self.type = type
        getMovies()
        getTvShows()
    }
}

extension ListViewModel {
    
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
    
    func getTvShows() {
        cancellationToken = TvDB.request(path: "trending/tv/week")
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                self.tvshows = $0.tvshows
            })
    }
}

