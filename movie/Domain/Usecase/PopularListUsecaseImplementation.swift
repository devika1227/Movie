//
//  PopularListUsecaseImplementation.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class PopularListUsecaseImplementation: PopularListUsecase {
    private let popularRepository = PopularImplementationRepository()
    
    func fetchPopularMovieList(completion: @escaping (Result<[Movie], Error>) -> Void) {
        popularRepository.fetchPopularMovieList { result in
            switch result {
                case .success(let movies):
                completion(.success(movies))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
