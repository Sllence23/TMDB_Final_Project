//
//  DiscoverView.swift
//  TMDB_Final_Project
//
//  Created by Igor Nasalik on 20/9/2023.
//

import SwiftUI

struct TMDBView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Image(systemName: "star")
                    } else {
                        VStack {
                            Text("TMDB Movies")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .padding()
                            HStack{
                                Button("Trending") {
                                    viewModel.loadTrending()
                                }
                                .foregroundColor(.green)
                                .font(.system(size: 25))
                                .background(Color.gray)
                                .fontWeight(.heavy)
                                .cornerRadius(5)
                                Spacer()
                                //
                                Button("Diverging") {
                                    viewModel.loadLessPopularMovies()
                                }
                                .foregroundColor(.red)
                                .font(.system(size: 25))
                                .background(Color.gray)
                                .fontWeight(.heavy)
                                .cornerRadius(5)

                            }
                        }
                        .padding(.horizontal
                        )
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    VStack() {
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)
                            }
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color.black)
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TMDBView()
    }
}
