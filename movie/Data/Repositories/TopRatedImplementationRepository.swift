//
//  TopRatedImplementationRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

class TopRatedImplementationRepository: TopRatedRepository {
    private let topRatedAPIClient = TopRatedAPIClientImplementationRepository()
    
    func fetchTopRatedMovieList(completion: @escaping (Result<[Movie], Error>) -> Void) {
        topRatedAPIClient.fetchTopRatedMovieList { result in
            switch result {
                case .success(let model):
                completion(.success(model.convertToMovie()))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
