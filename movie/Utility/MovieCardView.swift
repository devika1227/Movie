//
//  MovieCardView.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie?
    let type: ListType?
    let image: String?
    
    init(movie: Movie, listType: ListType = .nowPlaying) {
        self.movie = movie
        self.type = listType
        self.image = listType == .nowPlaying ? self.movie?.posterImage : self.movie?.backdropPath
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(type == .nowPlaying ? 0.6 : 1.6, contentMode: .fit)
                    .frame(width: type == .nowPlaying ? UIScreen.main.bounds.width/2.5 : UIScreen.main.bounds.width/1.5)
                    .cornerRadius(5)
                    .shadow(radius: 5)
            } placeholder: {
                    ProgressView()
                    .frame(width: 200, height: 200)
            }
        }
    }
}
