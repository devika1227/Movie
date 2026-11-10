//
//  topRatedAPIClientImplementation.swift
//  movie
//
//  Created by Devika on 18/07/24.
//

import Foundation

class TopRatedAPIClientImplementationRepository: TopRatedAPIClientRepository {
    private let networkManager = NetworkManager.shared

    func fetchTopRatedMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        let urlString = "\(URLConstant.baseURL)\(URLConstant.topRated)"
        networkManager.fetchAPIResponse(urlString: urlString, method: HTTPMethod.get, header: Header.header) { result in
            switch result {
                case .success(let data):
                do {
                    let topRatedList = try JSONDecoder().decode(MovieListModel.self, from: data)
                    completion(.success(topRatedList))
                } catch {
                    completion(.failure(error))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
