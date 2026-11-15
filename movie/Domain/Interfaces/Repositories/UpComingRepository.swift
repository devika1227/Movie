//
//  MovieRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

protocol UpComingRepository {
    func fetchUpComingMovieList(completion: @escaping (Result<[Movie], Error>) -> Void)
}
