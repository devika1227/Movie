//
//  UpComingAPIClientRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

protocol UpComingAPIClientRepository {
    func fetchUpComingMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void)
}
