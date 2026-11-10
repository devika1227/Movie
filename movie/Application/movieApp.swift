//
//  movieApp.swift
//  movie
//
//  Created by Devika on 09/07/24.
//

import SwiftUI
import SwiftData

@main
struct movieApp: App {
    var body: some Scene {
        WindowGroup {   
            ContentView()
                .environment(\.colorScheme, .dark) // Force dark mode
        }
    }
}
