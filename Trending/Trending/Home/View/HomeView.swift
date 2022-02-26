//
//  HomeView.swift
//  Trending
//
//  Created by Anton on 25/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(){
                NavigationLink(destination: MovieView()) {
                    Text("🎬Movies🎬")
                        .padding(30)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                
                NavigationLink(destination: TvView()) {
                    Text("📺TV Shows📺")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            
            .navigationTitle("Trending now")
        }
    }
}
