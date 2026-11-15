//
//  HomeView.swift
//  movie
//
//  Created by Devika on 17/07/24.
//

import SwiftUI

struct MovieListView: View {
   @StateObject private var movieListViewModel = MovieListViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // NowPlaying list
                    TitleView(title: "Now Playing")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(movieListViewModel.nowPlayingMovieList ?? []) { movie in
                                NavigationLink(destination: MovieDetailView(movieDetail: movie)) {
                                    MovieCardView(movie: movie, listType: .nowPlaying)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                    
                    // UpComing list
                    TitleView(title: "UpComing")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(movieListViewModel.upComingovieList ?? []) { movie in
                                VStack(alignment: .leading, spacing: 10) {
                                    NavigationLink(destination: MovieDetailView(movieDetail: movie)) {
                                        MovieCardView(movie: movie, listType: .upComing)
                                    }
                                    Text(movie.title)
                                        .font(.headline)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 30)
                    
                    // TopRated list
                    TitleView(title: "Top Rated")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(movieListViewModel.topRatedMovieList ?? []) { movie in
                                VStack(alignment: .leading, spacing: 10) {
                                    NavigationLink(destination: MovieDetailView(movieDetail: movie)) {
                                        MovieCardView(movie: movie, listType: .topRated)
                                    }
                                    Text(movie.title)
                                        .font(.headline)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                }
                .padding(.leading, 15)
                .navigationTitle("Watch Movies 🍿")
                .onAppear {
                    movieListViewModel.loadMovies(listType: .nowPlaying)
                    movieListViewModel.loadMovies(listType: .upComing)
                    movieListViewModel.loadMovies(listType: .topRated)
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
