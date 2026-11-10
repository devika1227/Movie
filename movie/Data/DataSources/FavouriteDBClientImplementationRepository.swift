//
//  FavouriteDBClientImplementation.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation
import SwiftData

class FavouriteDBClientImplementationRepository: FavouriteDBClientRepository {
    private let swiftDataManager = SwiftDataManager.shared

    func isFavouriteMovie(movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        swiftDataManager.isFavouriteMovie(movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func favouriteAction(isFavourite: Bool, movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        swiftDataManager.favouriteAction(isFavourite: isFavourite, movieDetail: movieDetail) { status in
            completion(status)
        }
    }
    
    func fetchFavouriteMovieList(completion: @escaping ([FavouriteMovies]) -> Void) {
        swiftDataManager.fetchFavouriteMovieList { movies in
            completion(movies)
        }
    }
}
