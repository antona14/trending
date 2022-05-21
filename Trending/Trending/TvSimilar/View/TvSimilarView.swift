//
//  TvSimilar.swift
//  Trending
//
//  Created by Anton on 28/02/2022.
//

import SwiftUI

struct TvSimilarView: View {
    
    @ObservedObject var viewModel: TvSimilarViewModel

    var id: Int
    
    init(id: Int) {
        self.id = id
        self.viewModel = TvSimilarViewModel(id: id)
    }

    var body: some View {
        List(viewModel.tvshows) { tvshow in
            NavigationLink(destination: TvDetailView(id: tvshow.tvId)) {
                HStack{
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342" + tvshow.posterPath)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 41, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    
                    VStack(alignment: .leading){
                        Text(tvshow.name)
                            .font(.headline)
                        Text("(" + tvshow.firstAirDate.prefix(4) + ")")
                            .font(.caption)
                        Text("Rating: \(tvshow.voteAverage, specifier: "%.1f") (\(tvshow.voteCount) votes)")
                            .font(.caption)
                    }
                }
            }
        }
        .navigationBarTitle("Trending TV Shows")
    }
}
