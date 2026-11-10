//
//  NowPlayingRepository.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

protocol NowPlayingRepository {
    func fetchNowPlayingMovieList(completion: @escaping (Result<[Movie], Error>) -> Void)
}
