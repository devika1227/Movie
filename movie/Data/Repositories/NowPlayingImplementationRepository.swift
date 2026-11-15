//
//  NowPlayingImplementationRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class NowPlayingImplementationRepository: NowPlayingRepository {
    private let nowPlayingAPIClient = NowPlayingAPIClientImplementationRepository()
    
    func fetchNowPlayingMovieList(completion: @escaping (Result<[Movie], Error>) -> Void) {
        nowPlayingAPIClient.fetchNowPlayingMovieList { result in
            switch result {
                case .success(let model):
                completion(.success(model.convertToMovie()))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
