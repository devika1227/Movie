//
//  NowPlayingViewModel.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    private let usecase = MovieListUsecaseImplementation()
    @Published var nowPlayingMovieList: [Movie]?
    @Published var upComingovieList: [Movie]?
    @Published var topRatedMovieList: [Movie]?
    
    func loadMovies(listType: ListType) {
        usecase.fetchMovieList(listType: listType, completion: { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    switch listType {
                    case .nowPlaying:
                        self.nowPlayingMovieList = movies
                    case .upComing:
                        self.upComingovieList = movies
                    case .topRated:
                        self.topRatedMovieList = movies
                    }
                }
            case .failure(let error):
                print("Failed to fetch items: \(error)")
            }
        })
    }
}
