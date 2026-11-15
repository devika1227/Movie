//
//  FavouriteDBClientRepository.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation
import SwiftData

protocol FavouriteDBClientRepository {
    func isFavouriteMovie(movieDetail: Movie?, completion: @escaping(Bool) -> Void)
    func favouriteAction(isFavourite: Bool, movieDetail: Movie?, completion: @escaping(Bool) -> Void)
    func fetchFavouriteMovieList(completion: @escaping ([FavouriteMovies]) -> Void)
}
