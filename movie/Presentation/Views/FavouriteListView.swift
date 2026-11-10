//
//  FavouriteListView.swift
//  movie
//
//  Created by Devika on 06/08/24.
//

import SwiftUI
import SwiftData

struct FavouriteListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] // Define two columns with flexible width
    @StateObject private var favouriteListViewModel = FavouriteListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // Favourite list
                    TitleView(title: "Favourites")
                        .padding(.top, 5)
                        .padding(.leading, 15)
                    
                    VStack {
                        if let movies = favouriteListViewModel.favouriteMovieList, movies.isEmpty {
                            Spacer() // Push content to the center vertically
                            Text("Your favorite list is empty.")
                                .font(.title3)
                                .foregroundColor(.gray)
                            Spacer() // Push content to the center vertically
                        } else {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(favouriteListViewModel.favouriteMovieList ?? [], id: \.id) { movie in
                                    VStack(alignment: .center) {
                                        NavigationLink(destination: MovieDetailView(movieDetail: movie)) {
                                            AsyncImage(url: URL(string: movie.posterImage)) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: 200)
                                                    .cornerRadius(5)
                                                    .shadow(radius: 5)
                                            } placeholder: {
                                                ProgressView()
                                                    .frame(width: UIScreen.main.bounds.width/3, height: 200)
                                            }
                                        }
                                        Text("\(movie.title)")
                                            .font(.headline)
                                            .padding(.top, 5)
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
                Spacer()
                .onAppear() {
                    favouriteListViewModel.loadFavouriteMovies()
                }
        }
    }
}

#Preview {
    FavouriteListView()
}
