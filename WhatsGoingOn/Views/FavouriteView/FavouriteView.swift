//
//  FavouriteView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 20.07.2023.
//

import SwiftUI

struct FavouriteView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                if articlesViewModel.articles.isEmpty {
                    Text("Nothing there")
                        .padding()
                }
                
                List {
                    ForEach(articlesViewModel.articles, id: \.id) { news in
                        FavouriteItemView(article: news)
                    }
                }
            }
        }
        .navigationTitle("Fav")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FavouriteView()
        }
    }
}
