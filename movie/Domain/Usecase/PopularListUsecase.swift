//
//  PopularUsecase.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

protocol PopularListUsecase {
    func fetchPopularMovieList(completion: @escaping (Result<[Movie], Error>) -> Void)
}
