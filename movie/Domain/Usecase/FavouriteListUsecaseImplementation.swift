//
//  FavouriteListUsecaseImplementation.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation
import SwiftData

class FavouriteListUsecaseImplementation: FavouriteListUsecase {
    private let favouriteRepository = FavouriteImplementationRepository()
    
    func isFavouriteMovie(movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        favouriteRepository.isFavouriteMovie(movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func favouriteAction(isFavourite: Bool, movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        favouriteRepository.favouriteAction(isFavourite: isFavourite, movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func fetchFavouriteMovieList(completion: @escaping ([FavouriteMovies]) -> Void) {
        favouriteRepository.fetchFavouriteMovieList { movies in
            completion(movies)
        }
    }
}
