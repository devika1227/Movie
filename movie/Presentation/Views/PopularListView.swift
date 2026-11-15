//
//  PopularListView.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import SwiftUI

struct PopularListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] // Define two columns with flexible width
    @StateObject private var popularListViewModel = PopularListViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // Popular list
                    TitleView(title: "Popular")
                        .padding(.top, 5)
                        .padding(.leading, 15)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(searchResults, id: \.id) { movie in
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
                Spacer()
            }
            .onAppear {
                popularListViewModel.loadPopularMovies()
            }
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Movie] {
        if searchText.isEmpty {
            return popularListViewModel.movieList ?? []
        } else {
            return popularListViewModel.movieList?.filter { $0.title.localizedCaseInsensitiveContains(searchText) } ?? []
        }
    }
}

#Preview {
    PopularListView()
}
