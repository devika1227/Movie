//
//  PopularAPIClientImplementationRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class PopularAPIClientImplementationRepository: PopularAPIClientRepository {
    private let networkManager = NetworkManager.shared

    func fetchPopularMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void) {
        let urlString = "\(URLConstant.baseURL)\(URLConstant.popular)"
        networkManager.fetchAPIResponse(urlString: urlString, method: HTTPMethod.get, header: Header.header) { result in
            switch result {
                case .success(let data):
                do {
                    let popularList = try JSONDecoder().decode(MovieListModel.self, from: data)
                    completion(.success(popularList))
                } catch {
                    completion(.failure(error))
                }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
