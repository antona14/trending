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

                if let overview = viewModel.detail?.overview {
                    Text(overview)
                        .font(.body)
                        .padding(5)
                        .background(.gray)
                }

                if let releaseDate = viewModel.detail?.releaseDate{
                    Text("Release date: " + releaseDate)
                        .font(.body)
                }

                if let imdb = viewModel.detail?.imdbId{
                    Link("IMDB", destination: URL(string: "https://www.imdb.com/title/" + imdb)!)
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
//
//                if let genres = viewModel.detail?.genres{
//                    List(genres) { gen in
//                        Text("gen.name")
//                    }
//                }
                
//                runtime
//                revenue vs budget
//                popularity
//                homepage
                
                
//                Spacer()
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(detail: <#T##Detail#>)
//    }
//}
