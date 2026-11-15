//
//  NowPlayingListModel.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import Foundation

// MARK: - MovieListModel
struct MovieListModel: Codable {
    let page: Int
    let results: [MovieListResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    func convertToMovie() -> [Movie] {
        results.map {
            let releaseYear = String($0.releaseDate.split(separator: "-").first ?? "")
            let movie = Movie(id: $0.id, title: $0.title, posterImage: URLConstant.imageURL+$0.posterPath, backdropPath: URLConstant.imageURL+$0.backdropPath, overView: $0.overview, releaseYear: releaseYear)
            return movie
        }
    }
}

// MARK: - MovieListResult
struct MovieListResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
