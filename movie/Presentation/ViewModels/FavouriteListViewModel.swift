//
//  FavouriteViewModel.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation

class FavouriteListViewModel: ObservableObject {
    private let usecase = FavouriteListUsecaseImplementation()
    @Published var favouriteMovieList: [Movie]?
    
    func loadFavouriteMovies() {
        usecase.fetchFavouriteMovieList { movies in
            let movies = movies.map { movie in
                return Movie(id: movie.id, title: movie.title, posterImage: movie.posterImage, backdropPath: movie.backdropPath, overView: movie.overView, releaseYear: movie.releaseYear)
            }
            self.favouriteMovieList = movies
        }
    }
}
