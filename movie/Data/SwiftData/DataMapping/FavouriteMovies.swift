//
//  Item.swift
//  movie
//
//  Created by Devika on 04/08/24.
//

import Foundation
import SwiftData

@Model
final class FavouriteMovies: Identifiable {
    @Attribute(.unique) var id: Int
    let title: String
    let posterImage: String
    let backdropPath: String
    let overView: String
    let releaseYear: String
    
    init(id: Int, title: String, posterImage: String, backdropPath: String, overView: String, releaseYear: String) {
        self.id = id
        self.title = title
        self.posterImage = posterImage
        self.backdropPath = backdropPath
        self.overView = overView
        self.releaseYear = releaseYear
    }
}
