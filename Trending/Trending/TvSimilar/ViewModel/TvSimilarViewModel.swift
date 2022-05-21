//
//  TvSimilarViewModel.swift
//  Trending
//
//  Created by Anton on 28/02/2022.
//

import Foundation
import Combine

class TvSimilarViewModel: ObservableObject {
    
    @Published var tvshows: [TvShow] = []
    
    var cancellationToken: AnyCancellable?
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        getSimilarTv(id: id)
    }
}

extension TvSimilarViewModel {
    
    func getSimilarTv(id: Int) {
        cancellationToken = TvSimilarDB.request(path: "tv/\(id)/similar")
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
