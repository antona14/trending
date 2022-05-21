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
                        .background(Color.ColorPrimary)
                }
                
                if let id = viewModel.detail?.tvId {
                    NavigationLink(destination: TvSimilarView(id: id)) {
                        Text("Click here for similar tv shows")
                            .padding(20)
                    }
                }

                if let lastAirDate = viewModel.detail?.lastAirDate{
                    Text("Last episode air date: " + lastAirDate)
                        .font(.body)
                }

//                if let homepa = viewModel.detail?.homepage{
//                    Link("Homepage", destination: URL(string: homepa)!)
//                        .font(.largeTitle)
//                        .foregroundColor(.red)
//                }
            }
        }.background(Color.BackgroundColorList)
    }
    
}
