//
//  FavouriteDBClientRepository.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation
import SwiftData

class FavouriteImplementationRepository {
    private let favouriteDBClient = FavouriteDBClientImplementationRepository()
    
    func isFavouriteMovie(movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        favouriteDBClient.isFavouriteMovie(movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func favouriteAction(isFavourite: Bool, movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        favouriteDBClient.favouriteAction(isFavourite: isFavourite, movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func fetchFavouriteMovieList(completion: @escaping ([FavouriteMovies]) -> Void) {
        favouriteDBClient.fetchFavouriteMovieList { movies in
            completion(movies)
        }
    }
}
