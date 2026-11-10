//
//  NowPlayingUsecaseImplementation.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class MovieListUsecaseImplementation: MovieListUsecase {
    private let nowPlayingRepository = NowPlayingImplementationRepository()
    private let upComingRepository = UpComingImplementationRepository()
    private let topRatedRepository = TopRatedImplementationRepository()
    
    func fetchMovieList(listType: ListType, completion: @escaping (Result<[Movie], Error>) -> Void) {
        switch listType {
        case .nowPlaying:
            nowPlayingRepository.fetchNowPlayingMovieList { result in
                switch result {
                    case .success(let movies):
                    completion(.success(movies))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        case .upComing:
            upComingRepository.fetchUpComingMovieList { result in
                switch result {
                    case .success(let movies):
                    completion(.success(movies))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        case .topRated:
            topRatedRepository.fetchTopRatedMovieList { result in
                switch result {
                    case .success(let movies):
                    completion(.success(movies))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
        }
    }
}
