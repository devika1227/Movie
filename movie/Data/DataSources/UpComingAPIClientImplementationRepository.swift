//
//  MovieImplementationRepository.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

class UpComingAPIClientImplementationRepository: UpComingAPIClientRepository {
    private let networkManager = NetworkManager.shared

    func fetchUpComingMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        let urlString = "\(URLConstant.baseURL)\(URLConstant.upcoming)"
        networkManager.fetchAPIResponse(urlString: urlString, method: HTTPMethod.get, header: Header.header) { result in
            switch result {
                case .success(let data):
                do {
                    let upComingList = try JSONDecoder().decode(MovieListModel.self, from: data)
                    completion(.success(upComingList))
                } catch {
                    completion(.failure(error))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
