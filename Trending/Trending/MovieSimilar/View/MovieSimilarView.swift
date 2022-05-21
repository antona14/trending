//
//  SimilarView.swift
//  Trending
//
//  Created by Anton on 28/02/2022.
//

import SwiftUI

struct MovieSimilarView: View {
    
    @ObservedObject var viewModel: MovieSimilarViewModel

    var id: Int
    
    init(id: Int) {
        self.id = id
        self.viewModel = MovieSimilarViewModel(id: id)
    }

    var body: some View {
        List(viewModel.movies) { movie in
            NavigationLink(destination: MovieDetailView(id: movie.movieId)) {
                HStack{
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342" + movie.poster)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 41, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    
                    VStack(alignment: .leading){
                        Text(movie.title)
                            .font(.headline)
                        Text("(" + movie.releaseDate.prefix(4) + ")")
                            .font(.caption)
                        Text("Rating: \(movie.voteAverage, specifier: "%.1f") (\(movie.voteCount) votes)")
                            .font(.caption)
                    }
                }
            }
        }
        .navigationBarTitle("Trending movies")
    }
}
