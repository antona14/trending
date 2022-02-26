//
//  TvViewModel.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import Foundation
import Combine

class TvViewModel: ObservableObject {
    @Published var tvshows: [TvShow] = []
    
    var cancellationToken: AnyCancellable?
    
    init() {
        getTvShows()
    }
}

extension TvViewModel {
    
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
