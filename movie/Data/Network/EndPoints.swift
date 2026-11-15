//
//  Constant.swift
//  movie
//
//  Created by Devika on 17/07/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Auth {
    static let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NmU3NmY5YTlmNjdlZDAxZTg4YWZhZDMzZDViZmJkMyIsIm5iZiI6MTcyMDYwNDM1NC4yOTEyNTksInN1YiI6IjY2OGQwMTI5ZDQ5MDQ5Mzc3NTBkZWI0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xk2yoQsRO725j9s5GLDyDuk-BRSZ2pMn7-5Z8biQPNw"
}

struct Header {
    static let header = [
        "accept": "application/json",
        "Authorization": Auth.token
      ]
}

struct URLConstant {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    static let nowPlaying = "movie/now_playing"
    static let upcoming = "movie/upcoming"
    static let topRated = "movie/top_rated"
    static let popular = "movie/popular"
}
