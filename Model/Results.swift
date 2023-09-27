//
//  TrendingResults.swift
//  TMDB_Final_Project
//
//  Created by Igor Nasalik on 20/9/2023.
//

import Foundation

struct Results: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
