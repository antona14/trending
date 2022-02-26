//
//  TvDetailViewModel.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import Foundation
import Combine

class TvDetailViewModel: ObservableObject {
    
    @Published var detail: TvDetail?
    
    var cancellationToken: AnyCancellable?
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        getTvDetails(id: id)
    }
}

extension TvDetailViewModel {
    
    // Subscriber
    func getTvDetails(id: Int) {
        cancellationToken = TvDetailDB.request(path: "tv/\(id)")
//        cancellationToken = TvDetailDB.request(path: "tv/76331")
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: { detail in
                self.detail = detail
                print("Received: \(detail)")
            })
    }
}
