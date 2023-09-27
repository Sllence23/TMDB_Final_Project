//
//  TrendingCard.swift
//  TMDB_Final_Project
//
//  Created by Igor Nasalik on 20/9/2023.
//

import Foundation
import SwiftUI

struct TrendingCard: View {

    let trendingItem: Movie

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 240)
            } placeholder: {
                Rectangle().fill(Color.gray)
                        .frame(width: 400, height: 240)
                        .cornerRadius(15)
            }

            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                HStack {
                    Image(systemName: "star")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color.gray)
        }
        .cornerRadius(5)
    }
}
