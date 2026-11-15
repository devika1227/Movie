//
//  PopularImplementationRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class PopularImplementationRepository {
    private let popularAPIClient = PopularAPIClientImplementationRepository()
    
    func fetchPopularMovieList(completion: @escaping (Result<[Movie], Error>) -> Void) {
        popularAPIClient.fetchPopularMovieList { result in
            switch result {
                case .success(let model):
                completion(.success(model.convertToMovie()))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
