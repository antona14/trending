//
//  TvDetailView.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import SwiftUI

struct TvDetailView: View {
    
    @ObservedObject var viewModel: TvDetailViewModel
    
    var id: Int
    
    init(id: Int) {
        self.id = id
        self.viewModel = TvDetailViewModel(id: id)
    }
    
    var body: some View {
        ScrollView{
            VStack{
                if let poster = viewModel.detail?.posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342" + poster)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 270, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                if let title = viewModel.detail?.name{
                    Text(title)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
                
                if let tagline = viewModel.detail?.tagline{
                    Text(tagline)
                        .font(.headline)
                }
                
                if let seasons = viewModel.detail?.numberOfSeasons {
                    Text(String(seasons) + " seasons")
                }

                if let overview = viewModel.detail?.overview {
                    Text(overview)
                        .font(.body)
                        .padding(5)
                        .background(.gray)
                }

//                if let releaseDate = viewModel.detail?.releaseDate{
//                    Text("Release date: " + releaseDate)
//                        .font(.body)
//                }

                if let homepa = viewModel.detail?.homepage{
                    Link("Homepage", destination: URL(string: homepa)!)
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }

                
//                runtime
//                revenue vs budget
//                popularity
//                homepage
                
                
//                Spacer()
            }
        }
    }
    
}
