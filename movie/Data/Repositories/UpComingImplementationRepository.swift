//
//  MovieImplementationRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

class UpComingImplementationRepository: UpComingRepository {
    private let upComingAPIClient = UpComingAPIClientImplementationRepository()
    
    func fetchUpComingMovieList(completion: @escaping (Result<[Movie], Error>) -> Void) {
        upComingAPIClient.fetchUpComingMovieList { result in
            switch result {
                case .success(let model):
                completion(.success(model.convertToMovie()))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
