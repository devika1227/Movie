//
//  TopRatedRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

protocol TopRatedRepository {
    func fetchTopRatedMovieList(completion: @escaping (Result<[Movie], Error>) -> Void)
}
