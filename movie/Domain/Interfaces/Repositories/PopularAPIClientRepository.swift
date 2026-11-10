//
//  PopularAPIClientRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

protocol PopularAPIClientRepository {
    func fetchPopularMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void)
}
