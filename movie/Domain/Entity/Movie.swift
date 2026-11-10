//
//  MovieListEntity.swift
//  movie
//
//  Created by Devika on 11/07/24.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let posterImage: String
    let backdropPath: String 
    let overView: String
    let releaseYear: String
}

