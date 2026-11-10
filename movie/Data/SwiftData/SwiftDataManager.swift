//
//  SwiftDataManager.swift
//  movie
//
//  Created by Devika on 25/08/24.
//

import SwiftUI
import SwiftData

class SwiftDataManager {
    static let shared = SwiftDataManager()
    private var context: ModelContext?
    private var container: ModelContainer?
    private var favouriteMovies: [FavouriteMovies] = []
    
    private init() {
        self.container = try? ModelContainer(for: FavouriteMovies.self)
        if let container {
            self.context = ModelContext(container)
        }
    }
    
    func isFavouriteMovie(movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        guard let movieDetail = movieDetail, let context = self.context else { return completion(false) }
        let id = movieDetail.id
        let descriptor = FetchDescriptor<FavouriteMovies>(
            predicate: #Predicate { movie in
                movie.id == id
            }
        )
        do {
            favouriteMovies = try context.fetch(descriptor)
            completion(!favouriteMovies.isEmpty)
        } catch {
            debugPrint("ERROR: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func favouriteAction(isFavourite: Bool?, movieDetail: Movie?, completion: @escaping (Bool) -> Void) {
        guard let isFavorite = isFavourite, let movieDetail = movieDetail, let context = self.context else { return completion(false) }
        let id = movieDetail.id
        let descriptor = FetchDescriptor<FavouriteMovies>(
            predicate: #Predicate { movie in
                movie.id == id
            }
        )
        do {
            favouriteMovies = try context.fetch(descriptor)
            
            if isFavorite && favouriteMovies.count == 0 {
                let favouriteItem = FavouriteMovies(id: movieDetail.id, title: movieDetail.title, posterImage: movieDetail.posterImage, backdropPath: movieDetail.backdropPath, overView: movieDetail.overView, releaseYear: movieDetail.releaseYear)
                context.insert(favouriteItem)
            } else if !isFavorite && favouriteMovies.count != 0 {
                if let movie = favouriteMovies.first {
                    context.delete(movie)
                }
            }
            
            try context.save()
            completion(true)
        } catch {
            debugPrint("ERROR: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func fetchFavouriteMovieList(completion: @escaping ([FavouriteMovies]) -> Void) {
        guard let context = self.context else { return completion([]) }
        let descriptor = FetchDescriptor<FavouriteMovies>()
        do {
            favouriteMovies = try context.fetch(descriptor)
            completion(favouriteMovies)
        } catch {
            debugPrint("ERROR: \(error.localizedDescription)")
            completion([])
        }
    }
}
