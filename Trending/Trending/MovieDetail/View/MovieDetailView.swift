//
//  DetailView.swift
//  Trending
//
//  Created by Anton on 18/02/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var viewModel: MovieDetailViewModel

    var id: Int
    
    init(id: Int) {
        self.id = id
        self.viewModel = MovieDetailViewModel(id: id)
    }
        
    var body: some View {
        ScrollView{
            VStack{
                if let poster = viewModel.detail?.poster {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342" + poster)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 270, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                if let title = viewModel.detail?.title{
                    Text(title)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
                
                if let tagline = viewModel.detail?.tagline{
                    Text(tagline)
                        .font(.headline)
                }
                
                if let runtime = viewModel.detail?.runtime {
                    Text(String(runtime) + " minutes")
                }

                if let overview = viewModel.detail?.overview {
                    Text(overview)
                        .font(.body)
                        .padding(5)
                        .background(Color.ColorPrimary)
                }
                
                if let releaseDate = viewModel.detail?.releaseDate{
                    Text("Release date: " + releaseDate)
                        .font(.body)
                }
                
                if let budget = viewModel.detail?.budget, let revenue = viewModel.detail?.revenue {
                    Text("Budget: $" + String(budget))
                    Text("Revenue: $" + String(revenue))
                    
                    let profit = revenue - budget
                    if profit > 0 {
                        Text("Profit: $" + String(profit))
                            .foregroundColor(.green)
                    } else if profit == 0 {
                        Text("Profit: $" + String(profit))
                            .foregroundColor(.yellow)
                    } else {
                        Text("Profit: $" + String(profit))
                            .foregroundColor(.red)
                    }
                }
                
                if let id = viewModel.detail?.movieId {
                    NavigationLink(destination: MovieSimilarView(id: id)) {
                        Text("Click here for similar movies")
                            .padding(20)
                    }
                }
                
                HStack {
                    if let imdb = viewModel.detail?.imdbId{
                        Link("IMDB", destination: URL(string: "https://www.imdb.com/title/" + imdb)!)
                            .font(.largeTitle)
                            .padding(20)
                    }
                    
//                    if let homepage = viewModel.detail?.homepage{
//                        Link("Homepage", destination: URL(string: homepage)!)
//                            .font(.largeTitle)
//                            .padding(20)
//                    }
                }
                
                Spacer()
            }
        }.background(Color.BackgroundColorList)
    }
}
