//
//  TopRatedAPIClientRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

protocol TopRatedAPIClientRepository {
    func fetchTopRatedMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void)
}
