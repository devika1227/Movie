//
//  MovieDetailViewModel.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import Foundation
import SwiftData

class MovieDetailViewModel: ObservableObject {
    private let usecase = FavouriteListUsecaseImplementation()
    @Published var isFavourite: Bool = false
    
    func isFavouriteMovie(movieDtail: Movie?) {
        usecase.isFavouriteMovie(movieDetail: movieDtail) { status in
            self.isFavourite = status
        }
    }
    
    func toggleFavouriteIcon() {
        isFavourite.toggle()
    }
    
    func favouriteAction(movieDetail: Movie?) {
        usecase.favouriteAction(isFavourite: isFavourite, movieDetail: movieDetail) { status in
            switch status {
            case true:
                debugPrint("Favourite action successful")
            case false:
                debugPrint("Favourite action failed some reasons...")
            }
        }
    }
}
