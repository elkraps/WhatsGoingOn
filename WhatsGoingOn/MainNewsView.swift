//
//  MainNewView.swift
//  WhatsGoingOn
//
//  Created by Vlad Dzirko on 05.07.2023.
//

import SwiftUI

struct MainNewsView: View {
    
    @ObservedObject var articlesViewModel = ArticlesViewModel()
    
    let articles: [Article]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    NewsView(article: article)
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
//            .searchable(text: $articlesViewModel.searchString)
        }
    }
}

struct MainNewView_Previews: PreviewProvider {
    static var previews: some View {
        MainNewsView(articles: Article.previewData)
    }
}
