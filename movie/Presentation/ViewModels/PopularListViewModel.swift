//
//  PopularMovieListViewModel.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation
import SwiftUI

class PopularListViewModel: ObservableObject {
    private let usecase = PopularListUsecaseImplementation()
    @Published var movieList: [Movie]?
    
    func loadPopularMovies() {
        usecase.fetchPopularMovieList(completion: { result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movieList = movies
                }
            case .failure(let error):
                print("Failed to fetch items: \(error)")
            }
        })
    }
}
