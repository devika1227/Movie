//
//  NowPlayingUsecase.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

protocol MovieListUsecase {
    func fetchMovieList(listType: ListType, completion: @escaping (Result<[Movie], Error>) -> Void)
}
