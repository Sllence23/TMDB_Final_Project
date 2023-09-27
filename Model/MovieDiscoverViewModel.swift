//
//  MovieDiscoverViewModel.swift
//  TMDB_Final_Project
//
//  Created by Igor Nasalik on 20/9/2023.
//

import Foundation

@MainActor
class MovieDiscoverViewModel: ObservableObject {

    @Published var trending: [Movie] = []
    @Published var searchResults: [Movie] = []

    static let apiKey = "ab8ca7862f2733af2356c592de5f9d45"

    //
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDiscoverViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(Results.self, from: data)
                trending = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    //
    func loadLessPopularMovies() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(MovieDiscoverViewModel.apiKey)&sort_by=popularity.asc")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let moviesResults = try JSONDecoder().decode(Results.self, from: data)
                trending = moviesResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}
