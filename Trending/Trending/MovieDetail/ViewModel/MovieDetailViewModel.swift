//
//  DetailViewModel.swift
//  Trending
//
//  Created by Anton on 18/02/2022.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    
    @Published var detail: MovieDetail?
    
    var cancellationToken: AnyCancellable?
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        getMovieDetails(id: id)
    }
}

extension MovieDetailViewModel {
    
    // Subscriber
    func getMovieDetails(id: Int) {
        cancellationToken = MovieDetailDB.request(path: "movie/\(id)")
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { detail in
                self.detail = detail
            })
    }
}
