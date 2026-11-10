//
//  NowPlayingAPIClientImplementationRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class NowPlayingAPIClientImplementationRepository: NowPlayingAPIClientRepository {
    private let networkManager = NetworkManager.shared

    func fetchNowPlayingMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        let urlString = "\(URLConstant.baseURL)\(URLConstant.nowPlaying)"
        networkManager.fetchAPIResponse(urlString: urlString, method: HTTPMethod.get, header: Header.header) { result in
            switch result {
                case .success(let data):
                do {
                    let nowPlayingList = try JSONDecoder().decode(MovieListModel.self, from: data)
                    completion(.success(nowPlayingList))
                } catch {
                    completion(.failure(error))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
