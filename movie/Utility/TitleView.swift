//
//  TitleView.swift
//  movie
//
//  Created by Devika on 19/07/24.
//

import SwiftUI

struct TitleView: View {
    let title: String?
    
    init(title: String = "") {
        self.title = title
    }
    
    var body: some View {
        if let title = self.title {
            Text(title)
                .fontWeight(.bold)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.white, .red]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(Text(title)
                        .fontWeight(.bold)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    )
                )
                Spacer()  
        }
    }
}
