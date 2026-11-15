//
//  ContentView.swift
//  movie
//
//  Created by Devika on 17/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PopularListView()
                .tabItem {
                    Label("Popular", systemImage: "film")
                }
            FavouriteListView()
                .tabItem {
                    Label("Favourite", systemImage: "heart")
                }
        }
        .accentColor(Color.red)
    }
}

#Preview {
    ContentView()
}
