//
//  DetailView.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import SwiftUI
import SwiftData

struct MovieDetailView: View {
    let movieDetail: Movie?
    @StateObject private var movieDetailViewModel = MovieDetailViewModel()

    init(movieDetail: Movie?) {
        self.movieDetail = movieDetail
    }
        
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                ZStack(alignment: .bottomTrailing) {
                    // Movie poster
                    AsyncImage(url: URL(string: movieDetail?.backdropPath ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(1.84, contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width)
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                    }
                    Button(action: {
                        withAnimation {
                            movieDetailViewModel.toggleFavouriteIcon()
                            movieDetailViewModel.favouriteAction(movieDetail: movieDetail)
                        }
                    }) {
                        Image(systemName: movieDetailViewModel.isFavourite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(movieDetailViewModel.isFavourite ? .red : .gray)
                            .padding()
                    }
                }
                
                // Movie name
                Text(movieDetail?.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // Release year
                Text("Release Year: \(movieDetail?.releaseYear ?? "")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                
                // Overview
                Text(movieDetail?.overView ?? "")
                    .font(.subheadline)
                    .padding(.top, 0)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
            }
        }
            .toolbar(.hidden, for: .tabBar) // Hide the tab bar
            .onAppear {
                movieDetailViewModel.isFavouriteMovie(movieDtail: movieDetail)
            }
    }
}

#Preview {
    MovieDetailView(movieDetail: Common.dummyItem)
}
