//
//  NowPlayingAPIClientRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

protocol NowPlayingAPIClientRepository {
    func fetchNowPlayingMovieList(completion: @escaping (Result<MovieListModel, Error>) -> Void)
}
